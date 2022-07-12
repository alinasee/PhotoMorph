//
//  ResultVC.swift
//  PhotoMorph
//
//  Created by Alina on 20.06.22.
//

import UIKit

class ResultVC: UIViewController {

    var image: UIImage?
    
    @IBOutlet weak var editedView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        editedView.image = image



    }


 
}
