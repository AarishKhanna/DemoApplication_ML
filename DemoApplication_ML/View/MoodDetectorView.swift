//
//  MoodDetectorView.swift
//  DemoApplication_ML
//
//  Created by Aarish Khanna on 17/05/23.
//

import SwiftUI
import AVFoundation
import PhotosUI
import Vision

struct MoodDetectorView: View {
    //MARK: - Properties
    //@State private var selectedItem: [PhotosPickerItem] = [PhotosPickerItem]() // use to select multiple images from gallery
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImageData: Data? = nil
    @State var cgImage: CGImage? = nil
    @State var scaledImageRect: CGRect? = nil
    @State var showMainView: Bool = false
    @State var isSpeaking: Bool = false
    @State var isResume: Bool = false
    @State var test: Bool = false
   // @State var identifier: String? = nil
    
  //  let chatgpt = OpenAIConnector()

    
    //MARK: - Body
    
    
    var body: some View {
        
        if showMainView{
            MainView()
        }
        
        else{
            
            VStack(spacing: 20) {
                
                
                HStack{
                    Button("Back"){
                        
                        self.showMainView = true
                        
                    }
                    
                    
                    Spacer(minLength: 0)
                    
                }
                
                
                Spacer(minLength: 0)
                
                if let selectedImageData, let uiImage = UIImage(data: selectedImageData) {
                    
                    
                    
                    
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16).stroke(Color.blue, lineWidth: 5)
                        )
//                        .onChange(of: uiImage) { test in
//                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
//                                let utterance = AVSpeechUtterance(string: "This image is of" + performVisionRequest(cgImage: uiImage.cgImage!))
//                                                          utterance.rate = 0.4
//                                                          utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
//                                                          synth.speak(utterance)
//                            }
//
//                        }
//
                    
                    
                    Text("You look " + performVisionRequest(cgImage: uiImage.cgImage!) + " right now")
                        .frame(width: 350, height: 50)
                        .fontWeight(.bold)
                    
//                        .onChange(of: $selectedItem, perform: {
//                            let utterance = AVSpeechUtterance(string: "This image is of" + performVisionRequest(cgImage: uiImage.cgImage!))
//                            utterance.rate = 0.4
//                            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
//                            synth.speak(utterance)
//
//})
                        .onAppear(perform: {
                            let utterance = AVSpeechUtterance(string: "You look " + performVisionRequest(cgImage: uiImage.cgImage!) + " right now.")
                            identifier = performVisionRequest(cgImage: uiImage.cgImage!)
                            utterance.rate = 0.4
                            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                            synth.speak(utterance)
                        })
//                                            .onChange(of: test) { test in
//
//
//                                            }
                        
                    
                    
                    Spacer(minLength: 0)
                    if isSpeaking{
                        
                        Text("Pause")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                            .background{
                                Capsule()
                                    .fill(Color(uiColor: .systemRed))
                            }
                            .padding(.horizontal, 38)
                            .onTapGesture {
                                synth.pauseSpeaking(at: AVSpeechBoundary.immediate)
                                isSpeaking = false
                                isResume = true
                            }
                    }
                    else if !isSpeaking && isResume {
                        Text("Resume")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                            .background{
                                Capsule()
                                    .fill(Color(uiColor: .systemGreen))
                            }
                            .padding(.horizontal, 38)
                            .onTapGesture {
                                synth.continueSpeaking()
                                isSpeaking = true
                            }
                    }
                    
                    
                  
                    if(performVisionRequest(cgImage: uiImage.cgImage!) == "Happy"){
                        
                        Text("Benefits of being Happy")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                            .background{
                                Capsule()
                                    .fill(Color(uiColor: .systemBlue))
                            }
                            .padding(.horizontal, 38)
                            .onTapGesture {
                                isResume = false
                                isSpeaking = false
                                synth.stopSpeaking(at: AVSpeechBoundary.immediate)
                                identifier = performVisionRequest(cgImage: uiImage.cgImage!)
                                var botResponse = getBotResponse(for: "Tell me some benefits of being happy and some tips for the same")
                                print(botResponse)
                                readOut(text: "Here are the benefits of being happy " + botResponse)
                                isSpeaking = true
                                isResume = true
                           
                            }

                        
                        
//                                    readOut(text: "Let me tell you a joke to make you happier")
//                                    var botResponse = getBotResponse(for: "Tell me a joke to make me laugh")
//                                    print(botResponse)
//                                    readOut(text: botResponse)
                        
                    }
                    else if (performVisionRequest(cgImage: uiImage.cgImage!) == "Angry"){
                        Text("Listen a Joke now")
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .frame(maxWidth: .infinity)
                            .background{
                                Capsule()
                                    .fill(Color(uiColor: .systemBlue))
                            }
                            .padding(.horizontal, 38)
                            .onTapGesture {
                                isResume = false
                                isSpeaking = false
                                synth.stopSpeaking(at: AVSpeechBoundary.immediate)
                                readOut(text: "Let me tell you a joke to make you happier")
                                var botResponse = getBotResponse(for: "Tell me a joke to make me laugh")
                                print(botResponse)
                                readOut(text: botResponse)
                                isSpeaking = true
                                isResume = true
                           
                            }
                        
                    }

                    
                    
                    
                    
                    
                    
                    
                    
                }
                
              
                
                
                PhotosPicker(
                    selection: $selectedItem,
                    // maxSelectionCount: 2, //set max selection from gallery
                    matching: .images,
                    photoLibrary: .shared()
                ) {
                    Text("Choose Image from Gallery")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background{
                            Capsule()
                                .fill(Color(uiColor: .systemBlue))
                        }
                        .padding(.horizontal, 38)
                      
                    
                }
                .onChange(of: selectedItem) { newValue in
                    Task { // Incase of multiple selection newValue is of array type
                        if let data = try? await newValue?.loadTransferable(type: Data.self) {
                            selectedImageData = data
                            
                        }
                    }
                    
                    synth.stopSpeaking(at: AVSpeechBoundary.immediate)
                    isResume = false
                    isSpeaking = false
                    test.toggle()
//                    if let selectedImageData, let uiImage = UIImage(data: selectedImageData) {
//                        DispatchQueue.main.async{
//                            let utterance = AVSpeechUtterance(string: "This image is of" + performVisionRequest(cgImage: uiImage.cgImage!))
//                            utterance.rate = 0.4
//                            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
//                            synth.speak(utterance)
//                        }
//                    }
                   
                    
                    
                }
                
                
           
                
                
                
            }
            .padding()
        }
    }
}


struct MoodDetectorView_Previews: PreviewProvider {
    static var previews: some View {
        MoodDetectorView()
    }
}

private func readOut(text: String) {
      
        let utterance = AVSpeechUtterance(string: text)
        utterance.rate = 0.4
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        print(text)

        synth.speak(utterance)
    }


private func performVisionRequest(cgImage: CGImage) -> String {
    let model = try? VNCoreMLModel(for: CNNEmotions(()).model)
    var temp = "test"
    
   

    let request = VNCoreMLRequest(model: model!){
        (finishReq, err) in

        print(finishReq.results!)
        
        guard let results = finishReq.results as? [VNClassificationObservation] else { return }
        guard let firstObservation = results.first else { return }
        print(firstObservation.identifier, firstObservation.confidence)
        temp = firstObservation.identifier
        
    }
    
        try? VNImageRequestHandler(cgImage: cgImage,
                                   orientation: .up,
                                   options: [:]).perform([request])
   
    
    return temp

    
}



//func getBotResponse(for message: String) -> String {
//    let chatgpt = OpenAIConnector()
//
//    if let response = chatgpt.processPrompt(prompt: message){
//        return response
//    } else {
//        return "Error...Try Again !!!"
//    }
//
//}

extension CNNEmotions {
    convenience init(_ foo: Void) {
        try! self.init(contentsOf: type(of:self).urlOfModelInThisBundle)
    }
}
