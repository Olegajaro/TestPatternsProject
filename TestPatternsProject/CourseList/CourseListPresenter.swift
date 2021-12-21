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
    
    func didTapCell(at indexPath: IndexPath) {
        guard let course = dataStore?.courses[indexPath.row] else { return }
        router.openCourseDetailsViewController(with: course)
    } 
}

extension CourseListPresenter: CourseListInteractorOutputProtocol {
    func coursesDidRecieve(_ dataStore: CourseListData) {
        self.dataStore = dataStore
        let section = CourseSectionViewModel()
        dataStore.courses.forEach {
            section.rows.append(CourseCellViewModel(course: $0))
        }
        /*
        dataStore.courses.forEach { course in
            let courseCellViewModel = CourseCellViewModel(course: course)
            section.rows.append(courseCellViewModel)
        }
         */
        view.reloadData(for: section)
    }
}
