//
//  MainView.swift
//  DemoApplication_ML
//
//  Created by Aarish Khanna on 25/04/23.
//

import SwiftUI

struct MainView: View {
    
    @State var showOnboardingView: Bool = false
    @State var showUploadImageView: Bool = false
    @State var showCameraView: Bool = false
    @State var moodDetectorView: Bool = false
    
    @State var onBoardingItems: OnboardingItem = (
        .init(title: " ", subTitle: " ", lottieView: .init(name: "109280-mobile-phone", bundle: .main))
    )
    var body: some View {
        if showOnboardingView{
            OnBoardingScreen()
        }
        else if showUploadImageView{
          //  if #available(iOS 16.0, *) {
                uploadImageView()
         //   } else {
                // Fallback on earlier versions
           // }
        }
        else if showCameraView{
            TextRecognitionView()
        }
        else if moodDetectorView{
            MoodDetectorView()
        }
        else{
            GeometryReader{
                let size = $0.size
                VStack(spacing: 10){

                  
                    ResizableLottieView(onBoardingItem: $onBoardingItems)
                        .frame(height: size.width)
                        .onAppear{
                            onBoardingItems.lottieView.play()
                            
                        }
                
                    Spacer(minLength: 0)
                    
                    Text("Recognize Text in Image")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background{
                            Capsule()
                                .fill(Color(uiColor: .systemBlue))
                        }
                        .padding(.horizontal, 38)
                        .onTapGesture{
                            
                            self.showCameraView = true
                            
                        }
                    
                    Text("Identify Objects in Image")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background{
                            Capsule()
                                .fill(Color(uiColor: .systemBlue))
                        }
                        .padding(.horizontal, 38)
                        .onTapGesture{
                            self.showUploadImageView = true
                        }
                    
                    Text("Let's Detect your Mood")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background{
                            Capsule()
                                .fill(Color(uiColor: .systemBlue))
                        }
                        .padding(.horizontal, 38)
                        .onTapGesture{
                            self.moodDetectorView = true
                            
                        }
                    
                    Spacer(minLength: 0)
                    
                    
//                    Text("Hello, World!ssssss")
//                        .onTapGesture {
//                            self.showOnboardingView = true
//                        }
                }
                
            }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


