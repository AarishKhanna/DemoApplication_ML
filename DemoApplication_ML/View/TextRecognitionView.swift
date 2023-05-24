//
//  LiveCameraView.swift
//  DemoApplication_ML
//
//  Created by Aarish Khanna on 12/05/23.
//

import SwiftUI
import Vision
import PhotosUI
import AVFoundation
import MLKit

struct TextRecognitionView: View {
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
    var translator: Translator!
   // @State var identifier: String? = nil
    
  //  let chatgpt = OpenAIConnector()

    
    //MARK: - Body
//
//    func model(forLanguage: TranslateLanguage) -> TranslateRemoteModel {
//      return TranslateRemoteModel.translateRemoteModel(language: forLanguage)
//    }
//
//    func translate() {
//
//        let options = TranslatorOptions(sourceLanguage: .english, targetLanguage: .spanish)
//      //  self.translator =
//        let translatorForDownloading = Translator.translator(options: options)
//        print("yes")
//
//                let optionss = TranslatorOptions(sourceLanguage: .english, targetLanguage: .german)
//                let englishGermanTranslator = Translator.translator(options: optionss)
//                let conditions = ModelDownloadConditions(
//                    allowsCellularAccess: true,
//                    allowsBackgroundDownloading: true
//                )
//                englishGermanTranslator.downloadModelIfNeeded(with: conditions) { error in
//                    guard error == nil else { return }
//                    print("heresss")
//                    englishGermanTranslator.translate("hello how are you") { translatedText, error in
//                              guard error == nil, let translatedText = translatedText else { return }
//
//                              // Translation succeeded.
//                        print(translatedText)
//                          }
//
//                    // Model downloaded successfully. Okay to start translating.
//                }
//
//      translatorForDownloading.downloadModelIfNeeded { error in
//        guard error == nil else {
//         // self.outputTextView.text = "Failed to ensure model downloaded with error \(error!)"
//          return
//        }
//      //  self.setDownloadDeleteButtonLabels()
//        if translatorForDownloading == self.translator {
//            translatorForDownloading.translate("Hello how are you" ) { result, error in
//            guard error == nil else {
//              print("Failed with error \(error!)")
//              return
//            }
//            if translatorForDownloading == self.translator {
//              let text = result
//                print("hor v")
//                print(text!)
//            }
//          }
//        }
//      }
//    }

    
    
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
//                    .onAppear(perform: {
//                        let model = self.model(forLanguage: .spanish)
//                        let modelManager = ModelManager.modelManager()
//
//                        let conditions = ModelDownloadConditions(
//                          allowsCellularAccess: true,
//                          allowsBackgroundDownloading: true
//                        )
//                        modelManager.download(model, conditions: conditions)
//                    })
                    
                    
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
                    
                    
                    Text("Text in this image is: " + performVisionRequest(cgImage: uiImage.cgImage!))
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
                            let utterance = AVSpeechUtterance(string: "Text in this image is " + performVisionRequest(cgImage: uiImage.cgImage!))
                            utterance.rate = 0.4
                            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
                            synth.speak(utterance)
                        })
//                                            .onChange(of: test) { test in
//
//
//                                            }
                    
//                    Button("Click"){
//
//                        self.translate()
//
//                    }
                        
                    
                    
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
                    
                  
                    
                    
                    
                    
                    Text("Explain the Text")
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
                            var botResponse = getBotResponse(for: "Explain the text: " + identifier!)
                            print(botResponse)
                           let temp = readOut(text: "Here is the explanation of the text: " + identifier! + botResponse)
                            
                            if (temp == 1){
                                isSpeaking = false
                                isResume = false
                            }
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

struct TextRecognitionView_Previews: PreviewProvider {
    static var previews: some View {
        TextRecognitionView()
    }
}


private func readOut(text: String) -> Int {
      
        let utterance = AVSpeechUtterance(string: text)
        utterance.rate = 0.4
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        print(text)

        synth.speak(utterance)
        return 1
    }




private func performVisionRequest(cgImage: CGImage) -> String {
    
    var temp = "test"
    
    //handler
    let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
    
   //request
    let request = VNRecognizeTextRequest{
        request, error in
        
        guard let observations = request.results as? [VNRecognizedTextObservation],
              error == nil else{
            return
        }
        
        let text = observations.compactMap({
            $0.topCandidates(1).first?.string
        }).joined(separator: " ")
        
        temp = text
//        let options = TranslatorOptions(sourceLanguage: .english, targetLanguage: .german)
//        let englishGermanTranslator = Translator.translator(options: options)
//        let conditions = ModelDownloadConditions(
//            allowsCellularAccess: true,
//            allowsBackgroundDownloading: true
//        )
//        englishGermanTranslator.downloadModelIfNeeded(with: conditions) { error in
//            guard error == nil else { return }
//            print("heresss")
//            englishGermanTranslator.translate(text) { translatedText, error in
//                      guard error == nil, let translatedText = translatedText else { return }
//
//                      // Translation succeeded.
//                print(translatedText)
//                  }
//
//            // Model downloaded successfully. Okay to start translating.
//        }
        
       
        print("***")
        print(temp)
        
    }
    
        //process request
    do{
        try handler.perform([request])
    }
    catch{
        print("here")
        print(error)
    }
    

    
    return temp

    
}


