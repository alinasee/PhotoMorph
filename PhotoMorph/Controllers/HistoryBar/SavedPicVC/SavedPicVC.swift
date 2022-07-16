//
//  SavedPicVC.swift
//  PhotoMorph
//
//  Created by Alina on 14.06.22.
//

import UIKit

class SavedPicVC: UIViewController {
    
    var image: UIImage?

    @IBOutlet weak var historyImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let image = image else {
            return
        }
        historyImage.image = image


    }



}
