//
//  CourseDetailsPresenter.swift
//  TestPatternsProject
//
//  Created by Олег Федоров on 18.12.2021.
//

import Foundation

struct CourseDetailsData {
    let courseName: String
    let numberOfLessons: Int
    let numberOfTests: Int
    let imageData: Data?
    let isFavorite: Bool
}

class CourseDetailsPresenter: CourseDetailsViewOutputProtocol {
    
    unowned let view: CourseDetailsViewInputProtocol
    var interactor: CourseDetailsInteractorInputProtocol!
    
    required init(view: CourseDetailsViewInputProtocol) {
        self.view = view
    }
    
    func showDetails() {
        interactor.provideCourseDetails()
    }
    
    func favoriteButtonPressed() {
        interactor.toggleFavoriteStatus()
    }
}

// MARK: - CourseDetailsInteractorOutputProtocol

extension CourseDetailsPresenter: CourseDetailsInteractorOutputProtocol {
    func receiveCourseDetails(with courseData: CourseDetailsData) {
        let numberOfLessons = "Number of lessons: \(courseData.numberOfLessons)"
        let numbetOfTests = "Number of tests: \(courseData.numberOfTests)"
        
        view.displayCourseName(with: courseData.courseName)
        view.displayNumberOfLessons(with: numberOfLessons)
        view.displayNumberOfTests(with: numbetOfTests)
        view.displayImageForFavoriteButton(with: courseData.isFavorite)
        
        guard let imageData = courseData.imageData else { return }
        view.displayCourseImage(with: imageData)
    }
    
    func receiveFavoriteStatus(with status: Bool) {
        view.displayImageForFavoriteButton(with: status)
    }
}
