//
//  SavedPicVC.swift
//  PhotoMorph
//
//  Created by Alina on 14.06.22.
//

import UIKit

class SavedPicVC: UIViewController {
    
    var image: UIImage?
    var imageToShare = [UIImage]()

    @IBOutlet weak var homeVCbutton: UIButton!
    @IBOutlet weak var historyImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let image = image else {
            return
        }
        historyImage.image = image
        historyImage.layer.cornerRadius = 40
        homeVCbutton.layer.cornerRadius = 8
    }
    
    @IBAction func saveToGalleryAction(_ sender: Any) {
        guard let image = historyImage.image else { return }
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
        guard let image = historyImage.image else { return }
        imageToShare.append(image)
        let shareSheet = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)
        present(shareSheet, animated: true)
    }
    
    @IBAction func shareToInstaAction(_ sender: Any) {
    }
    
    
    @IBAction func goHomeVCAction(_ sender: Any) {
        self.view.window!.rootViewController?.dismiss(animated: false, completion: nil)
    }
    

}
