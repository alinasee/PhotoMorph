//
//  ResultVC.swift
//  PhotoMorph
//
//  Created by Alina on 20.06.22.
//

import UIKit

class ResultVC: UIViewController {
    
    var image: UIImage?
    var imageToShare = [UIImage]()
    
    @IBOutlet weak var editedView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        editedView.image = image
    }
    @IBAction func saveToGalleryAction(_ sender: Any) {
        guard let image = editedView.image else { return }
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveImage(_:didFinishSavingWithError:contextInfo:)), nil)
        
    }
    @objc func saveImage(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            print("ERROR: \(error)")
        }
        else {
            self.showAlert("Загружено", message: "Изображение сохранено в фотогаллерею")
        }
    }
    private func showAlert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func shareAction(_ sender: Any) {
        guard let image = editedView.image else { return }
        imageToShare.append(image)
        let shareSheet = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
        present(shareSheet, animated: true)
    }
    
    
    
    @IBAction func sharingInstaStoryAction(_ sender: Any) {
        guard let image = editedView.image else { return }
//        shareToInstagramStories(image: image)
    }
    
//    func shareToInstagramStories(image: UIImage) {
//        // NOTE: you need a different custom URL scheme for Stories, instagram-stories, add it to your Info.plist!
//        if let storiesUrl = URL(string: "instagram-stories://share") {
//            if UIApplication.shared.canOpenURL(storiesUrl) {
//                guard let image  = editedView.image else { return }
//                guard let imageData = image.pngData() else { return }
//
//                let pasterboardItems: [String : Any] =
//                ["com.instagram.sharedSticker.backgroundImage": imageData, "com.instagram.sharedSticker.backgroundTopColor" : "#b2bec3",
//                 "com.instagram.sharedSticker.backgroundBottomColor": "##6c5ce7"]
//                let pasterboardOptions = [UIPasteboard.OptionsKey.expirationDate: Date().addingTimeInterval(300)
//                ]
//                UIPasteboard.general.setItems([pasterboardItems], options: pasterboardOptions)
//                UIApplication.shared.open(storiesUrl, options: [:], completionHandler: nil)
//            } else {
//                print ("Приложение Instagram на устройстве пользователя не установлено")
//            }
//
//        }
//    }
    
    
    
    
}




