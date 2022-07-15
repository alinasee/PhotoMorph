//
//  RealmManager.swift
//  PhotoMorph
//
//  Created by Alina on 15.07.22.
//

import Foundation
import RealmSwift


final class RealmManager {
    private  static let realm = try! Realm()
    
    static func read() -> [SavedImage] {
        let result = realm.objects(SavedImage.self)
        return Array(result)
        
    }
    
    static func save(object: SavedImage) {
         try? realm.write {
             realm.add(object)
        }
    }
    
}
