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
            return "firstEffect"
        case .secondEffect:
            return "secondEffect"
        case .thirdEffect:
            return "thirdEffect"
        case .fourthEffect:
            return "fourthEffect"
        case .fifthEffect:
            return "fifthEffect"
        case .sixthEffect:
            return "sixthEffect"
        case .seventhEffect:
            return "seventhEffect"
        case .eighthEffect:
            return "eighthEffect"
        case .ninthffect:
            return "ninthffect"
        case .tenthEffect:
            return "tenthEffect"
        case .eleventhEffect:
            return "eleventhEffect"
        }
    }
        
    var effectPic: UIImage {
        switch self {
        case .firstEffect:
            return UIImage(named: "11")!
        case .secondEffect:
            return UIImage(named: "12")!
        case .thirdEffect:
            return UIImage(named: "13")!
        case .fourthEffect:
            return UIImage(named: "14")!
        case .fifthEffect:
            return UIImage(named: "15")!
        case .sixthEffect:
            return UIImage(named: "16")!
        case .seventhEffect:
            return UIImage(named: "1")!
        case .eighthEffect:
            return UIImage(named: "2")!
        case .ninthffect:
            return UIImage(named: "3")!
        case .tenthEffect:
            return UIImage(named: "4")!
        case .eleventhEffect:
            return UIImage(named: "5")!
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
            return "version 1 (🔺 stylization, 🔻 robustness)"
        case .seventhEffect:
            return "version 1 (🔺 stylization, 🔻 robustness)"
        case .eighthEffect:
            return "version 1 (🔺 stylization, 🔻 robustness)"
        case .ninthffect:
            return "version 1 (🔺 stylization, 🔻 robustness)"
        case .tenthEffect:
            return "version 1 (🔺 stylization, 🔻 robustness)"
        case .eleventhEffect:
            return "version 1 (🔺 stylization, 🔻 robustness)"
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
