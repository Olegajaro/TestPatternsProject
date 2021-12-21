//
//  CourseListInteractor.swift
//  TestPatternsProject
//
//  Created by Олег Федоров on 21.12.2021.
//

import Foundation

protocol CourseListInteractorInputProtocol: AnyObject {
    init(presenter: CourseListInteractorOutputProtocol)
    func fetchCourses()
}

protocol CourseListInteractorOutputProtocol: AnyObject {
    func coursesDidRecieve(_ dataStore: CourseListData)
}

class CourseListInteractor: CourseListInteractorInputProtocol {
    
    unowned let presenter: CourseListInteractorOutputProtocol
    
    required init(presenter: CourseListInteractorOutputProtocol) {
        self.presenter = presenter
    }
    
    func fetchCourses() {
        NetworkManager.shared.fetchData { courses in
            let dataStore = CourseListData(courses: courses)
            self.presenter.coursesDidRecieve(dataStore)
        }
    }
}
