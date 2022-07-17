//
//  HomeVC.swift
//  PhotoMorph
//
//  Created by Alina on 20.06.22.
//

import UIKit

class HomeVC: UIViewController {
    var effects = Effect.allCases
    @IBOutlet weak var effectsCollectionView: UICollectionView!
    let heightToWidtCellConst = 0.6
    
    override func viewDidLoad() {
        super.viewDidLoad()
        effectsCollectionView.register(UINib(nibName: String(describing: EffectCell.self), bundle: nil), forCellWithReuseIdentifier: String(describing: EffectCell.self))
        effectsCollectionView.dataSource = self
        effectsCollectionView.delegate = self
    }
    
    
}

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return effects.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = effectsCollectionView.dequeueReusableCell(withReuseIdentifier: String(describing: EffectCell.self), for: indexPath) as! EffectCell
        cell.setupCell(effect: effects[indexPath.row])
        cell.backView.backgroundColor = UIColor.systemGray3
        cell.backView.isOpaque = true
//        cell.backView.layer.shadowColor = UIColor.black.cgColor
//        cell.backView.layer.shadowOffset = CGSize(width: 3, height: 3)
//        cell.backView.layer.shadowOpacity = 0.7
//        cell.backView.layer.shadowRadius = 4.0

        
        cell.backView.layer.cornerRadius = 40
        cell.effectPic.layer.cornerRadius = 40
        cell.effectPic.layer.shadowColor = UIColor.darkGray.cgColor
        
        cell.effectPic.layer.shadowOffset = CGSize(width: 10.0, height: 10.0);
        cell.effectPic.layer.shadowRadius = 17.0
        cell.effectPic.layer.shadowOpacity = 1
       return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photoVC = PhotoVC(nibName: String(describing: PhotoVC.self), bundle: nil)
        present(photoVC, animated: true)
        photoVC.effectPicImage.image = effects[indexPath.item].effectPic

    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameCV = effectsCollectionView.frame
        let widthCell = frameCV.width - 32
        let heightCell = widthCell * CGFloat(heightToWidtCellConst)
        return CGSize(width: widthCell, height: heightCell )
    }
    
   
}
