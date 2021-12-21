//
//  CourseDetailsInteractor.swift
//  TestPatternsProject
//
//  Created by Олег Федоров on 18.12.2021.
//

import Foundation

protocol CourseDetailsInteractorInputProtocol: AnyObject {
    var isFavorite: Bool { get }
    init(presenter: CourseDetailsInteractorOutputProtocol, course: Course)
    func provideCourseDetails()
    func toggleFavoriteStatus()
}

protocol CourseDetailsInteractorOutputProtocol: AnyObject {
    func receiveCourseDetails(with courseData: CourseDetailsData)
    func receiveFavoriteStatus(with status: Bool)
}

class CourseDetailsInteractor: CourseDetailsInteractorInputProtocol {
    
    unowned let presenter: CourseDetailsInteractorOutputProtocol
    
    var isFavorite: Bool {
        get {
            StorageManager.shared.getFavoriteStatus(for: course.name)
        } set {
            StorageManager.shared.setFavoritesStatus(for: course.name, with: newValue)
        }
    }
    
    private let course: Course
    
    required init(presenter: CourseDetailsInteractorOutputProtocol,
                  course: Course) {
        self.presenter = presenter
        self.course = course
    }
    
    func provideCourseDetails() {
        let imageData = ImageManager.shared.fetchImageData(from: course.imageURL)
        
        let courseDetailsData = CourseDetailsData(
            courseName: course.name,
            numberOfLessons: course.numberOfLessons,
            numberOfTests: course.numberOfTests,
            imageData: imageData,
            isFavorite: isFavorite
        )
        presenter.receiveCourseDetails(with: courseDetailsData)
    }
    
    func toggleFavoriteStatus() {
        isFavorite.toggle()
        presenter.receiveFavoriteStatus(with: isFavorite)
    }
}
