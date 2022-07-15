//
//  SavedImages.swift
//  PhotoMorph
//
//  Created by Alina on 15.07.22.
//

import Foundation
import RealmSwift

@objc final class SavedImage: Object {
    @objc dynamic var imageData = NSData()
   
}
