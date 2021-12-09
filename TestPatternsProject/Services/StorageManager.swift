//
//  StorageManager.swift
//  TestPatternsProject
//
//  Created by Олег Федоров on 09.12.2021.
//

import Foundation

class StorageManager {
    
    static let shared = StorageManager()
    
    private let userDefaults = UserDefaults()
    
    private init() {}
    
    func setFavoritesStatus(for courseName: String, with status: Bool) {
        userDefaults.set(status, forKey: courseName)
    }
    
    func getFavoriteStatus(for courseName: String) -> Bool {
        userDefaults.bool(forKey: courseName)
    }
}
