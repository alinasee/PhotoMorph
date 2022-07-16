//
//  HistoryCell.swift
//  PhotoMorph
//
//  Created by Alina on 15.07.22.
//

import UIKit

class HistoryCell: UITableViewCell {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var savedPicImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
       
    }
    func setupCell(savedImage: SavedImage){
        let imageData = savedImage.imageData
        guard let image = UIImage(data: imageData) else { return }
        savedPicImage.image = image
        let time = savedImage.time
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let stringDate = dateFormatter.string(from: time)
        timeLabel.text = stringDate
        savedPicImage.layer.cornerRadius = 40
        timeLabel.textColor = UIColor.darkGray

    }

}
