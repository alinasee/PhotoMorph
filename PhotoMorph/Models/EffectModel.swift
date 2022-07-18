//
//  EffectModel.swift
//  PhotoMorph
//
//  Created by Alina on 20.06.22.
//

import Foundation
import UIKit


enum Effect: CaseIterable {
    
    case firstEffect
    case secondEffect
    case thirdEffect
    case fourthEffect
    case fifthEffect
    case sixthEffect
    case seventhEffect
    case eighthEffect
    case ninthffect
    case tenthEffect
    case eleventhEffect
        
    var effectName: String{
        switch self{
        case .firstEffect:
            return "Watercolour"
        case .secondEffect:
            return "Romantic"
        case .thirdEffect:
            return "Dramatic"
        case .fourthEffect:
            return "Sinister"
        case .fifthEffect:
            return "Mysterious"
        case .sixthEffect:
            return "Сomics"
        case .seventhEffect:
            return "Disney"
        case .eighthEffect:
            return "Artistic"
        case .ninthffect:
            return "Aesthetic"
        case .tenthEffect:
            return "Sensual"
        case .eleventhEffect:
            return "Arcane"
        }
    }
        
    var effectPic: UIImage {
        switch self {
        case .firstEffect:
            return UIImage(named: "ef1")!
        case .secondEffect:
            return UIImage(named: "ef2")!
        case .thirdEffect:
            return UIImage(named: "ef3")!
        case .fourthEffect:
            return UIImage(named: "ef4")!
        case .fifthEffect:
            return UIImage(named: "ef5")!
        case .sixthEffect:
            return UIImage(named: "ef6")!
        case .seventhEffect:
            return UIImage(named: "ef7")!
        case .eighthEffect:
            return UIImage(named: "ef8")!
        case .ninthffect:
            return UIImage(named: "ef9")!
        case .tenthEffect:
            return UIImage(named: "ef10")!
        case .eleventhEffect:
            return UIImage(named: "ef11")!
        }
    }
    
    var payloadVersion: String {
        switch self {
        case .firstEffect:
            return "version 1 (🔺 stylization, 🔻 robustness)"
        case .secondEffect:
            return "version 2 (🔺 robustness,🔻 stylization)"
        case .thirdEffect:
            return "version 0.2"
        case .fourthEffect:
            return "version 0.3"
        case .fifthEffect:
            return "version 0.4"
        case .sixthEffect:
            return "JoJo"
        case .seventhEffect:
            return "Disney"
        case .eighthEffect:
            return "Yasuho"
        case .ninthffect:
            return "Arcane Multi"
        case .tenthEffect:
            return "Art"
        case .eleventhEffect:
            return "Spider-Verse"
        }
        
    }
}











//enum EffectType {
//    case robustness
//    case stilization
//    case romantic
//    case magical
//    case expressive
//    case art
//    case disney
//
//}
//
//
//enum Effect: CaseIterable {
//
//    case watercolour
//    case arcane
//    case artistic
//
//
//    var firstType: EffectType {
//        switch self {
//        case .watercolour:
//            return EffectType.robustness
//        case .arcane:
//            return EffectType.romantic
//        case .artistic:
//            return EffectType.art
//        }
//    }
//    var secondType: EffectType {
//        switch self {
//        case .watercolour:
//            return EffectType.stilization
//        case .arcane:
//            return EffectType.magical
//        case .artistic:
//            return EffectType.disney
//        }
//    }
//    var thirdType: EffectType? {
//        switch self {
//        case .watercolour:
//            return nil
//        case .arcane:
//            return EffectType.expressive
//        case .artistic:
//            return nil
//        }
//    }
//    var effectPic: UIImage {
//        switch self {
//        case .watercolour:
//            return UIImage(named: "1")!
//        case .arcane:
//            return UIImage(named: "2")!
//        case .artistic:
//            return UIImage(named: "3")!
//
//        }
//    }
//
//}





//struct Effect {
//    let name: String
//    let image: UIImage
//    let morphImage: UIImage
//}
//
//class Morphs {
//    var effects = [Effect]()
//
//
//    init() {
//        setup()
//    }
//
//    func setup() {
//        let ef1 = Effect(name: "ef1", image: <#T##UIImage#>, morphImage: <#T##UIImage#>)
//        let ef2 = Effect(name: "ef2", image: <#T##UIImage#>, morphImage: <#T##UIImage#>)
//        let ef3 = Effect(name: "ef3", image: <#T##UIImage#>, morphImage: <#T##UIImage#>)
//        let ef4 = Effect(name: "ef4", image: <#T##UIImage#>, morphImage: <#T##UIImage#>)
//        let ef5 = Effect(name: "ef5", image: <#T##UIImage#>, morphImage: <#T##UIImage#>)
//
//        self.effects = [ef1, ef2, ef3, ef4, ef5]
//
//
//    }
//
//
//
//}
