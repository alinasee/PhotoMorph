//
//  HistoryCell.swift
//  PhotoMorph
//
//  Created by Alina on 15.07.22.
//

import UIKit

class HistoryCell: UITableViewCell {
    
    var savedImage = SavedImage()

    @IBOutlet weak var chekLabel: UILabel!
    @IBOutlet weak var savedPicImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }
    func setupCell(savedImages: SavedImage){
        let imageData = savedImage.imageData
        
        let image: UIImage = UIImage(data: imageData as Data, scale:1.0)!
        savedPicImage.image = image
        
        
        
//        let imageData = savedImages.imageData
//        
//        let image = UIImage(data: imageData as Data, scale: 1)
//        
//        
//        savedPicImage.image = image
        
    }

}
