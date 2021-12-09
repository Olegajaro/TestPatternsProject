//
//  ImageManager.swift
//  TestPatternsProject
//
//  Created by Олег Федоров on 09.12.2021.
//

import Foundation

class ImageManager {
    
    static let shared = ImageManager()
    
    private init() {}
    
    func fetchImageData(from url: URL?) -> Data? {
        guard let url = url else { return nil }
        guard let imageData = try? Data(contentsOf: url) else { return nil}
        return imageData
    }
}
