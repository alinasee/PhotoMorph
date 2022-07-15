//
//  EffectCell.swift
//  PhotoMorph
//
//  Created by Alina on 20.06.22.
//

import UIKit

class EffectCell: UICollectionViewCell {

    @IBOutlet weak var effectLabel: UILabel!
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var effectPic: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setupCell(effect: Effect) {
        effectPic.image = effect.effectPic
        effectLabel.text = effect.effectName       
    
}
        
}
