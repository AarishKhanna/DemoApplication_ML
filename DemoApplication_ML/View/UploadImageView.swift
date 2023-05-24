//
//  uploadImageView.swift
//  DemoApplication_ML
//
//  Created by Aarish Khanna on 02/05/23.
//

import SwiftUI
import PhotosUI
import Vision
import AVFoundation
import OpenAISwift

let synth = AVSpeechSynthesizer()
var identifier: String?

//@available(iOS 16.0, *)
struct uploadImageView: View {
    
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
                    
                    
                    Text("This image is of " + performVisionRequest(cgImage: uiImage.cgImage!))
                        .frame(width: 350, height: .infinity)
                        .fontWeight(.bold)
                    
//                        .onChange(of: $selectedItem, perform: {
//                            let utterance = AVSpeechUtterance(string: "This image is of" + performVisionRequest(cgImage: uiImage.cgImage!))
//                            utterance.rate = 0.4
//                            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
//                            synth.speak(utterance)
//
//})
                        .onAppear(perform: {
                            let utterance = AVSpeechUtterance(string: "This image is of" + performVisionRequest(cgImage: uiImage.cgImage!))
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
                    
                  
                    
                    
                    
                    
                    Text("Know some Interesting Facts")
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
                            var botResponse = getBotResponse(for: "Tell some Interesting facts about" + identifier!)
                            print(botResponse)
                            readOut(text: "Here are the some of the interesting facts about " + identifier! + botResponse)
                            isSpeaking = true
                            isResume = true
                       
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

struct uploadImageView_Previews: PreviewProvider {
    static var previews: some View {
      //  if #available(iOS 16.0, *) {
            uploadImageView()
        //} else {
            // Fallback on earlier versions
        //}
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
    let model = try? VNCoreMLModel(for: Resnet50(()).model)
    var temp = "test"
    
   

    let request = VNCoreMLRequest(model: model!){
        (finishReq, err) in
        
        print(finishReq.results!)
        
        guard let results = finishReq.results as? [VNClassificationObservation] else { return }
        guard let firstObservation = results.first else { return }
        temp =  firstObservation.identifier
        
    }
    
    try? VNImageRequestHandler(cgImage: cgImage,
                               orientation: .up,
                               options: [:]).perform([request])
    
   
    
    return temp

    
}



func getBotResponse(for message: String) -> String {
    let chatgpt = OpenAIConnector()
    
    if let response = chatgpt.processPrompt(prompt: message){
        return response
    } else {
        return "Error...Try Again !!!"
    }

}



extension Resnet50 {
    convenience init(_ foo: Void) {
        try! self.init(contentsOf: type(of:self).urlOfModelInThisBundle)
    }
}

