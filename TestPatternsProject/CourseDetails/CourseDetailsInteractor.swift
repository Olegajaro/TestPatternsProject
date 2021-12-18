//
//  CourseDetailsInteractor.swift
//  TestPatternsProject
//
//  Created by Олег Федоров on 18.12.2021.
//

import Foundation

protocol CourseDetailsInteractorInputProtocol: AnyObject {
    init(presenter: CourseDetailsInteractorOutputProtocol, course: Course)
}

protocol CourseDetailsInteractorOutputProtocol: AnyObject {
    
}

class CourseDetailsInteractor: CourseDetailsInteractorInputProtocol {
    
    unowned let presenter: CourseDetailsInteractorOutputProtocol
    private let course: Course
    
    required init(presenter: CourseDetailsInteractorOutputProtocol,
                  course: Course) {
        self.presenter = presenter
        self.course = course
    }
}
