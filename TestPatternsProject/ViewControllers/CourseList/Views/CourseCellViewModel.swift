//
//  CourseCellViewModel.swift
//  TestPatternsProject
//
//  Created by Олег Федоров on 09.12.2021.
//

import Foundation

protocol CourseCellViewModelProtocol {
    var courseName: String { get }
    var imageData: Data? { get }
    init(course: Course)
}

class CourseCellViewModel: CourseCellViewModelProtocol {
    var courseName: String {
        course.name
    }
    
    var imageData: Data? {
        ImageManager.shared.fetchImageData(from: course.imageURL)
    }
    
    private let course: Course
    
    required init(course: Course) {
        self.course = course
    }
}
