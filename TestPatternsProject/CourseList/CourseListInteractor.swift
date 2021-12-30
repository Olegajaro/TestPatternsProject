//
//  CourseListInteractor.swift
//  TestPatternsProject
//
//  Created by Олег Федоров on 30.12.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import Foundation

protocol CourseListBusinessLogic {
    func fetchCourses()
}

protocol CourseListDataStore {
    var courses: [Course] { get }
}

class CourseListInteractor: CourseListBusinessLogic, CourseListDataStore {
    
    var presenter: CourseListPresentationLogic?
    var courses: [Course] = []
    
    func fetchCourses() {
        NetworkManager.shared.fetchData { [weak self] courses in
            guard let self = self else { return }
            
            self.courses = courses
            let response = CourseListResponse(courses: courses)
            self.presenter?.presentCourses(response: response)
        }
    }
}
