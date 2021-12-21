//
//  CourseListPresenter.swift
//  TestPatternsProject
//
//  Created by Олег Федоров on 21.12.2021.
//

import Foundation

struct CourseListData {
    let courses: [Course]
}

class CourseListPresenter: CourseListViewControllerOutputProtocol {
    
    unowned let view: CourseListViewControllerInputProtocol
    var interactor: CourseListInteractorInputProtocol!
    var router: CourseListRouterInputProtocol!
    
    private var dataStore: CourseListData?
    
    required init(view: CourseListViewControllerInputProtocol) {
        self.view = view
    }
    
    func viewDidLoad() {
        interactor.fetchCourses()
    }
}

extension CourseListPresenter: CourseListInteractorOutputProtocol {
    func coursesDidRecieve(_ dataStore: CourseListData) {
        self.dataStore = dataStore
        view.displayCourses(courses: dataStore.courses)
    }
}
