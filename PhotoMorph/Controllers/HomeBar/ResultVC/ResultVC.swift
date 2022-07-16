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
    
    @IBOutlet weak var goHomeVCButton: UIButton!
    @IBOutlet weak var editedView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let pic = image else { return }
        editedView.image = pic
        let imageData = pic.jpegData(compressionQuality: 1)
        let savedImage = SavedImage()
        savedImage.imageData = imageData!
        savedImage.time = Date()
        RealmManager.save(object: savedImage)
        
    }
    
    @IBAction func goHomeVCAction(_ sender: Any) {
        self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
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
        shareToInstagramStories(image: image)
    }
    
    func shareToInstagramStories(image: UIImage) {
        guard let storiesUrl = URL(string: "instagram-stories://share") else { return }
        if UIApplication.shared.canOpenURL(storiesUrl) {
            let paste = [["com.instagram.sharedSticker.backgroundImage": image as Any]]
            UIPasteboard.general.setItems(paste)
            UIApplication.shared.open(storiesUrl)
        }
    }
}




