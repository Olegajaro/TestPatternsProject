//
//  CourseListViewModel.swift
//  TestPatternsProject
//
//  Created by Олег Федоров on 09.12.2021.
//

import Foundation

protocol CourseListViewModelProtocol {
    func fetchCourses(completion: @escaping() -> Void)
    func numberOfRows() -> Int
    func cellViewModel(at indexPath: IndexPath) -> CourseCellViewModelProtocol
    func detailsViewModel(at indexPath: IndexPath) -> CourseDetailsViewModelProtocol
}

class CourseListViewModel: CourseListViewModelProtocol {
    private var courses: [Course] = []
    
    func fetchCourses(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchData { [weak self] courses in
            self?.courses = courses
            completion()
        }
    }
    
    func numberOfRows() -> Int {
        courses.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> CourseCellViewModelProtocol {
        let course = courses[indexPath.row]
        return CourseCellViewModel(course: course)
    }
    
    func detailsViewModel(at indexPath: IndexPath) -> CourseDetailsViewModelProtocol {
        let course = courses[indexPath.row]
        return CourseDetailsViewModel(course: course)
    }
}
