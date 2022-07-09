//
//  PhotoVC.swift
//  PhotoMorph
//
//  Created by Alina on 14.06.22.
//

import UIKit
import SwiftUI

class PhotoVC: UIViewController {
    
    var morphImage: UIImage?
    var imageBase64toSend: String!
    var imageBase64Received: UIImage?
    var sessionHash: String!
    let errorPic = UIImage(named: "errorPic")!
    
    
    
    @IBOutlet weak var loadIndicator: UIActivityIndicatorView!
    @IBOutlet weak var morphButton: UIButton!
    @IBOutlet weak var chekLabel: UILabel!
    @IBOutlet weak var effectPicImage: UIImageView!
    @IBOutlet weak var chosenPhotoImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        morphImage = nil
        if chosenPhotoImage.image == nil {
            morphButton.isEnabled = false
        }
    }
    @IBAction func takePhotoAction(_ sender: Any) {
        
        let cameraVC = UIImagePickerController()
        cameraVC.sourceType = .camera
        cameraVC.delegate = self
        present(cameraVC, animated: true)
    }
    @IBAction func selectPhotoAction(_ sender: Any) {
        let imageVC = UIImagePickerController()
        imageVC.delegate = self
        present(imageVC, animated: true)
    }
    @IBAction func morphAction(_ sender: Any) {
        convertImageToBase64()
        let prefix = "data:image/jpeg;base64,"
        let data = [prefix + imageBase64toSend, "version 1 (🔺 stylization, 🔻 robustness)"]
        let fnIndex = 0
        let action = "predict"
        loadIndicator.startAnimating()
        NetworkManager.postAnimeGanV1(action: action, data: data, fnIndex: fnIndex, sessionHash: sessionHash) { responce in
            guard let hash  = responce.hash else { return }
            print("хэш получен \(hash)")
            var counter = 0
            Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { timer in
                if counter <= 5 {
                    NetworkManager.statusAnimeGanV1(hash: hash) { statusResponse in
                        if statusResponse.status == "COMPLETE" {
                            guard let receivedArray = statusResponse.data?.data else { return }
                            let string = receivedArray[0]
                            let beginningOfSentence = string.lastIndex(of: ",")!
                            let firstSentence = string[beginningOfSentence...]
                            self.chekLabel.text = String(firstSentence)
                            let realString = String(firstSentence)
                            let image = self.convertBase64ToImage(base64String: realString )
                            
//                            let resultVC = ResultVC(nibName: (String(describing: ResultVC.self)), bundle: nil)
//                            self.navigationController?.pushViewController(resultVC, animated: true)
//                            resultVC.image = image
                        } else {
                            let alert  = UIAlertController(title: nil, message: "Проблемы с сервером, попробуйте еще раз", preferredStyle: .alert)
                            let okAction = UIAlertAction(title: "OK", style: .default)
                            alert.addAction(okAction)
                            self.present(alert, animated: true)
                        }
                    } failure: {
                        print("все плохо")
                        counter += 1
                    }
                }
                
            }
            
        } failure: {
            print("хэш не получен")
        }
        loadIndicator.startAnimating()
    }
    
    func convertImageToBase64(){
        let imageData = morphImage?.jpegData(compressionQuality: 1)
        imageBase64toSend = imageData?.base64EncodedString()
        print( imageBase64toSend ?? "Could not encode image to Base64")
    }
    
    func convertBase64ToImage(base64String: String) -> UIImage {
        let sourceData = Data()
        let base64String = sourceData.base64EncodedString()
        guard let stringData = Data(base64Encoded: base64String),
              let uiImage = UIImage(data: stringData) else {
            return errorPic}
        return uiImage
        
    }
    
    func generateRandomString() {
        let charSet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
        let charactersArray = Array(charSet)
        var randomString: String = ""
        for _ in (1...11) {
            randomString.append(charactersArray[Int(arc4random()) % charactersArray.count])
            sessionHash = randomString
        }
        
    }
    
}

extension PhotoVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerOriginalImage")] as? UIImage {
            chosenPhotoImage.image = image
            morphImage = image
            generateRandomString()
            if chosenPhotoImage.image != nil {
                morphButton.isEnabled = true
            }
            
        }
        
        picker.dismiss(animated: true)
    }
}


