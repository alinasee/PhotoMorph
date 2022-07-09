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
    let heightToWidtCellConst = 0.9
    
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
        let frameCV = effectsCollectionView.frame
        let widthBackView = frameCV.width
        let heightBackView = widthBackView * CGFloat(heightToWidtCellConst)
        cell.backView.frame.size.width = widthBackView
        cell.backView.frame.size.height = heightBackView
        cell.backView.backgroundColor = .gray
        cell.backView.layer.cornerRadius = 22
        cell.effectPic.image = effects[indexPath.item].effectPic
        cell.effectPic.layer.cornerRadius = 22
       return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let photoVC = PhotoVC(nibName: String(describing: PhotoVC.self), bundle: nil)
        present(photoVC, animated: true)
        photoVC.effectPicImage.image = effects[indexPath.item].effectPic

    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let frameCV = effectsCollectionView.frame
        let widthCell = frameCV.width
        let heightCell = widthCell * CGFloat(heightToWidtCellConst)
        return CGSize(width: widthCell, height: heightCell )
    }
   
}
