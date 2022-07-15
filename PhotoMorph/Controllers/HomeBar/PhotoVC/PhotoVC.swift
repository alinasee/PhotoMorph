//
//  PhotoVC.swift
//  PhotoMorph
//
//  Created by Alina on 14.06.22.
//

import UIKit
import SwiftUI

class PhotoVC: UIViewController {
    
    var effects = Effect.allCases
    var morphImage: UIImage?
    static var imageBase64toSend: String!
    var imageBase64Received: UIImage?
    var sessionHash: String!
    let errorPic = UIImage(named: "errorPic")!
    

    @IBOutlet weak var activityRing: UIActivityIndicatorView!
    @IBOutlet weak var morphButton: UIButton!
    @IBOutlet weak var backLabel: UILabel!
    @IBOutlet weak var backImage: UIImageView!
    @IBOutlet weak var effectPicImage: UIImageView!
    @IBOutlet weak var chosenPhotoImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        effectPicImage .layer.cornerRadius = 40
        backImage.image = UIImage(named: "placeholder-1")
        backImage.layer.cornerRadius = 40
        backImage.layer.borderWidth = 2
        backImage.layer.borderColor = UIColor.systemGray4.cgColor
        backLabel.textColor = UIColor.systemGray
        morphButton.layer.cornerRadius = 8
        chosenPhotoImage.layer.cornerRadius = 40
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
        activityRing.startAnimating()
        if effectPicImage.image == effects[0].effectPic {
                animeGanRequest(sessionHash: sessionHash, payloadVersion: effects[0].payloadVersion)
            } else if effectPicImage.image == effects[1].effectPic {
                animeGanRequest(sessionHash: sessionHash, payloadVersion: effects[1].payloadVersion)
            } else if effectPicImage.image == effects[2].effectPic {
                arcaneGanRequest(sessionHash: sessionHash, payloadVersion: effects[2].payloadVersion)
            } else if effectPicImage.image == effects[3].effectPic {
                arcaneGanRequest(sessionHash: sessionHash, payloadVersion: effects[3].payloadVersion)
            } else if effectPicImage.image == effects[4].effectPic {
                arcaneGanRequest(sessionHash: sessionHash, payloadVersion: effects[4].payloadVersion)
            } else if effectPicImage.image == effects[5].effectPic {
                jojoGanRequest(sessionHash: sessionHash, payloadVersion: effects[5].payloadVersion)
            } else if effectPicImage.image == effects[6].effectPic {
                jojoGanRequest(sessionHash: sessionHash, payloadVersion: effects[6].payloadVersion)
            } else if effectPicImage.image == effects[7].effectPic {
                jojoGanRequest(sessionHash: sessionHash, payloadVersion: effects[7].payloadVersion)
            } else if effectPicImage.image == effects[8].effectPic {
                jojoGanRequest(sessionHash: sessionHash, payloadVersion: effects[8].payloadVersion)
            } else if effectPicImage.image == effects[9].effectPic {
                jojoGanRequest(sessionHash: sessionHash, payloadVersion: effects[9].payloadVersion)
            } else if effectPicImage.image == effects[10].effectPic {
                jojoGanRequest(sessionHash: sessionHash, payloadVersion: effects[10].payloadVersion)
            }
        
        }
    
    func animeGanRequest(sessionHash: String, payloadVersion: String) {
        NetworkManager.postAnimeGan (sessionHash: sessionHash, payloadVersion: payloadVersion) { responce in
            guard let hash  = responce.hash else { return }
//            print("хэш получен \(hash)")
            var counter = 0
            Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { timer in
                if counter <= 5 {
                    NetworkManager.statusAnimeGan (hash: hash) { statusResponse in
                        if statusResponse.status == "COMPLETE" {
                            timer.invalidate()
                            guard let receivedArray = statusResponse.data?.data else { return }
                            let string = receivedArray[0]
                            let beginningOfSentence = string.lastIndex(of: ",")!
                            let slycedSentence = string[string.index(beginningOfSentence, offsetBy: 1)...]
                                                        self.activityRing.stopAnimating()
                            let realString = String(slycedSentence)
                            let image = self.convertBase64ToImage(base64String: realString )
                            let resultVC = ResultVC(nibName: (String(describing: ResultVC.self)), bundle: nil)
                            resultVC.image = image
                            self.present(resultVC, animated: true)
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
                } else {
                    timer.invalidate()}
            }
        } failure: {
            print("хэш не получен")
        }
    }
    
    func arcaneGanRequest(sessionHash: String, payloadVersion: String) {
        NetworkManager.postArcaneGan (sessionHash: sessionHash, payloadVersion: payloadVersion) { responce in
            guard let hash  = responce.hash else { return }
            print("хэш получен \(hash)")
            var counter = 0
            Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { timer in
                if counter <= 5 {
                    NetworkManager.statusArcaneGan (hash: hash) { statusResponse in
                        if statusResponse.status == "COMPLETE" {
                            timer.invalidate()
                            guard let receivedArray = statusResponse.data?.data else { return }
                            let string = receivedArray[0]
                            let beginningOfSentence = string.lastIndex(of: ",")!
                            let slycedSentence = string[string.index(beginningOfSentence, offsetBy: 1)...]
                            //                            self.loadIndicator.stopAnimating()
                            let realString = String(slycedSentence)
                            let image = self.convertBase64ToImage(base64String: realString )
                            let resultVC = ResultVC(nibName: (String(describing: ResultVC.self)), bundle: nil)
                            resultVC.image = image
                            self.present(resultVC, animated: true)
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
                } else {
                    timer.invalidate()}
            }
        } failure: {
            print("хэш не получен")
        }
    }
    
    func jojoGanRequest(sessionHash: String, payloadVersion: String) {
        NetworkManager.postJojoGan(sessionHash: sessionHash, payloadVersion: payloadVersion) { response in
            guard let receivedArray = response.data else { return }
            print("хэш получен \(receivedArray)")
            let string = receivedArray[0]
            let beginningOfSentence = string.lastIndex(of: ",")!
            let slycedSentence = string[string.index(beginningOfSentence, offsetBy: 1)...]
            //                            self.loadIndicator.stopAnimating()
            let realString = String(slycedSentence)
            let image = self.convertBase64ToImage(base64String: realString )
            let resultVC = ResultVC(nibName: (String(describing: ResultVC.self)), bundle: nil)
            resultVC.image = image
            self.present(resultVC, animated: true)
        } failure: {
            print("ответ не получен")
        }

    }

    
    
    func convertImageToBase64(){
        let imageData = morphImage?.jpegData(compressionQuality: 1)
        PhotoVC.imageBase64toSend = imageData?.base64EncodedString()
        print( PhotoVC.imageBase64toSend ?? "Could not encode image to Base64")
    }
    
    func convertBase64ToImage(base64String: String) -> UIImage {
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
           
        }
        sessionHash = randomString
    }
    
}

extension PhotoVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let image = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerOriginalImage")] as? UIImage {
            chosenPhotoImage.image = image
            morphImage = image
            convertImageToBase64()
            generateRandomString()
            if chosenPhotoImage.image != nil {
                morphButton.isEnabled = true
            }
            
        }
        
        picker.dismiss(animated: true)
    }
}


