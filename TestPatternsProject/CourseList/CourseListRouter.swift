//
//  CourseListRouter.swift
//  TestPatternsProject
//
//  Created by Олег Федоров on 21.12.2021.
//

import Foundation

protocol CourseListRouterInputProtocol {
    init(viewController: CourseListViewController)
    func openCourseDetailsViewController(with course: Course)
}

class CourseListRouter: CourseListRouterInputProtocol {
    unowned let viewController: CourseListViewController
    
    required init(viewController: CourseListViewController) {
        self.viewController = viewController
    }
    
    func openCourseDetailsViewController(with course: Course) {
        
    }
}
