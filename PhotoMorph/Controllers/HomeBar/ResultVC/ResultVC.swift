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
        let frameRect = editedView.frame;
        let rectPoint = frameRect.origin;
        let newXPos = rectPoint.x - 0.5;
        editedView.frame = CGRectMake(newXPos, 0.0, editedView.frame.size.width, editedView.frame.size.height);


    }


 
}
