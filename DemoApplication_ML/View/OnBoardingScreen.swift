//
//  OnBoardingScreen.swift
//  DemoApplication_ML
//
//  Created by Aarish Khanna on 24/04/23.
//

import SwiftUI
import Lottie

struct OnBoardingScreen: View {
    
    @State var onBoardingItems: [OnboardingItem] = [
        .init(title: "Explore IT!", subTitle: "Just upload to me anything and I'll tell you about it in detail, So let's find out", lottieView: .init(name: "38627-making-a-video.json", bundle: .main)),
        
            .init(title: "Recognize Text!", subTitle: "Just upload me image and I'll tell you about the text in the image and describe it you", lottieView: .init(name: "108979-image-scanning-finding-searching", bundle: .main)),
        
        .init(title: "Let's Guess your Mood!", subTitle: "I can guess your mood too, let us see how good is my guess, it will be interesting", lottieView: .init(name: "141703-happy-unhappy-button-animated", bundle: .main))
    ]
    
    @State var currentIndex: Int = 0
    @State var showMainView: Bool = false
    
    var body: some View {
        if showMainView{
            MainView()
        } else{
            GeometryReader{
                let size = $0.size
                
                HStack(spacing: 0){
                    
                    
                    ForEach($onBoardingItems){
                        $item in
                        let isLastSlide = (currentIndex == onBoardingItems.count - 1)
                        VStack{
                        //    if #available(iOS 16.0, *) {
                                HStack{
                                    Button("Back"){
                                        if currentIndex > 0{
                                            currentIndex -= 1
                                            playAnimation()
                                        }
                                        
                                    }
                                    .opacity(currentIndex > 0 ? 1 : 0)
                                    
                                    
                                    Spacer(minLength: 0)
                                    Button("Skip"){
                                        currentIndex = onBoardingItems.count - 1
                                        playAnimation()
                                        
                                    }
                                    .opacity(isLastSlide ? 0 : 1)
                                }
                                .animation(.easeInOut, value: currentIndex)
                                .tint(Color(uiColor: .systemGreen))
                                .fontWeight(.bold)
                         //   } else {
                                // Fallback on earlier versions
                         //   }
                            VStack(spacing: 15){
                                let offset = -CGFloat(currentIndex) * size.width
                                
                                ResizableLottieView(onBoardingItem: $item)
                                    .frame(height: size.width)
                                    .onAppear{
                                        if currentIndex == indexOf(item){
                                            item.lottieView.play()
                                        }
                                        
                                    }
                                    .offset(x: offset)
                                    .animation(.easeInOut(duration: 0.5), value: currentIndex)
                                
                                Text(item.title)
                                    .font(.title.bold())
                                    .offset(x: offset)
                                    .animation(.easeInOut(duration: 0.5).delay(0.1), value: currentIndex)
                                
                                Text(item.subTitle)
                                    .font(.system(size: 16))
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal,15)
                                    .foregroundColor(.gray)
                                    .offset(x: offset)
                                    .animation(.easeInOut(duration: 0.5).delay(0.2), value: currentIndex)
                                
                            }
                            Spacer(minLength: 0)
                            
                            VStack(spacing: 15){
                                Text(isLastSlide ? "Let's, Play" : "Next")
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .padding(.vertical, isLastSlide ? 13 : 12)
                                    .frame(maxWidth: .infinity)
                                    .background{
                                        Capsule()
                                            .fill(Color(uiColor: .systemGreen))
                                    }
                                    .padding(.horizontal, isLastSlide ? 30 : 70)
                                    .onTapGesture{
                                        if currentIndex < onBoardingItems.count - 1{
                                            
                                            //                                        let currentProgress = onBoardingItems[currentIndex].lottieView.currentProgress
                                            //                                        onBoardingItems[currentIndex].lottieView.currentProgress = (currentProgress == 0 ? 0.7 : currentProgress)
                                            onBoardingItems[currentIndex].lottieView.pause()
                                            currentIndex += 1
                                            playAnimation()
                                        }
                                        
                                        if isLastSlide {
                                            self.showMainView = true
                                        }
                                    }
                                
                            //    if #available(iOS 16.0, *) {
                                    HStack{
                                        Text("Terms of Service")
                                        Text("Privacy Policy")
                                    }
                                    .font(.caption2)
                                    .underline(true, color: .primary)
                                    .offset(y: 5)
                            //    } else {
                                    // Fallback on earlier versions
                               // }
                            }
                        }
                        .animation(.easeInOut, value: isLastSlide)
                        .padding(15)
                        .frame(width: size.width, height: size.height)
                    }
                }
                .frame(width: size.width * CGFloat(onBoardingItems.count),alignment: .leading)
            }}
    }
    
    func indexOf(_ item: OnboardingItem)->Int{
        if let index = onBoardingItems.firstIndex(of: item){
            return index
        }
        return 0
    }
    
    func playAnimation(){
        onBoardingItems[currentIndex].lottieView.currentProgress = 0
        onBoardingItems[currentIndex].lottieView.play()
    }
    
}

struct OnBoardingScreen_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct ResizableLottieView: UIViewRepresentable{
    @Binding var onBoardingItem: OnboardingItem
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        view.backgroundColor = .clear
        setupLottieView(view)
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func setupLottieView(_ to: UIView){
        let lottieView = onBoardingItem.lottieView
        lottieView.backgroundColor = .clear
        lottieView.translatesAutoresizingMaskIntoConstraints = false
        lottieView.loopMode = .loop
        
        let constraints = [
            lottieView.widthAnchor.constraint(equalTo: to.widthAnchor),
            lottieView.heightAnchor.constraint(equalTo: to.heightAnchor),
        ]
        to.addSubview(lottieView)
        to.addConstraints(constraints)
    }
}
