//
//  Course.swift
//  TestPatternsProject
//
//  Created by Олег Федоров on 09.12.2021.
//

import Foundation

struct Course: Codable {
    let id: Int
    let name: String
    let link: String
    let imageURL: String
    let numberOfLessons, numberOfTests: Int

    enum CodingKeys: String, CodingKey {
        case id, name, link
        case imageURL = "imageUrl"
        case numberOfLessons = "number_of_lessons"
        case numberOfTests = "number_of_tests"
    }
}
