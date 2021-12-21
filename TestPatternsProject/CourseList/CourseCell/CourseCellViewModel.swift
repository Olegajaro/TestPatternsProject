//
//  CourseCellViewModel.swift
//  TestPatternsProject
//
//  Created by Олег Федоров on 21.12.2021.
//

import Foundation

protocol CourseCellViewModelProtocol {
    var cellHeight: Double { get }
    var courseName: String { get }
    var imageData: Data? { get }
    init(course: Course)
}

protocol CourseSectionViewModelProtocol {
    var rows: [CourseCellViewModelProtocol] { get }
}

class CourseCellViewModel: CourseCellViewModelProtocol {
    var cellHeight: Double {
        100
    }
    
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

class CourseSectionViewModel: CourseSectionViewModelProtocol {
    var rows: [CourseCellViewModelProtocol] = []
}
