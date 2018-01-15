//
//  DataPersistence.swift
//  Unit4FinalAssessment-StudentVersion
//
//  Created by C4Q on 1/15/18.
//  Copyright © 2018 C4Q . All rights reserved.
//

import UIKit

class DataPersistenceHelper {
    
   
    private init() {}
    static let manager = DataPersistenceHelper()
    
    let filePath = "SavedAnimations.plist"
    
    struct UserAnimation: Codable {
        let name: String
        let animation: Animation
    }
    
    // Save changes
    private var favoriteAnimations: [UserAnimation] = [UserAnimation(name: "Default", animation: Animation(widthMultiplier: 1, heightMultiplier: 1, horizontalOffset: 0, verticalOffset: 0, duration: 1, flips: 0, opacity: 1, curvature: 0))] {
        didSet {
            saveFavoriteAnimations()
        }
    }
    
    
    
    // Gets the doc dir path
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    // Gets the file path in doc dir
    private func dataFilePath(withPathName path: String) -> URL {
        return DataPersistenceHelper.manager.documentsDirectory().appendingPathComponent(path)
    }
    
    // Loads
    func loadfavoriteAnimations() {
        var data = Data()
        do {
            data = try Data.init(contentsOf: DataPersistenceHelper.manager.dataFilePath(withPathName: filePath))
        } catch {
            print("Error retrieving data. \(error.localizedDescription)")
            return
        }
        
        do {
            favoriteAnimations = try PropertyListDecoder().decode([UserAnimation].self, from: data)
        } catch {
            print("Plist decoding error. \(error.localizedDescription)")
        }
    }
    
    // Returns this object's array
    func getFavoriteAnimations() -> [UserAnimation] {
        return favoriteAnimations
    }
    
    func addAnimation(name: String, animation: Animation) {
        favoriteAnimations.append(UserAnimation(name: name, animation: animation))
        
    }
    
    
    // Saves current array into the doc dir
    private func saveFavoriteAnimations() {
        var data = Data()
        
        do {
            data = try PropertyListEncoder().encode(favoriteAnimations)
        } catch {
            print("Plist encoding error. \(error.localizedDescription)")
            return
        }
        
        do {
            try data.write(to: DataPersistenceHelper.manager.dataFilePath(withPathName: filePath), options: .atomic)
            
        } catch {
            print("Writing to disk error. \(error.localizedDescription)")
        }
        
    }
    
    
    // Deletes save
    func deleteFavoriteAnimations() {
        favoriteAnimations.removeAll()
    }
    
    
    
    
}
