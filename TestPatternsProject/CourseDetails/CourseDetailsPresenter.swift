//
//  CourseDetailsPresenter.swift
//  TestPatternsProject
//
//  Created by Олег Федоров on 30.12.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

protocol CourseDetailsPresentationLogic {
    func presentCourseDetails(response: CourseDetailsResponse)
    func presentFavoriteStatus(response: CourseStatusResponse)
}

class CourseDetailsPresenter: CourseDetailsPresentationLogic {
    
    weak var viewController: CourseDetailsDisplayLogic?
    
    func presentCourseDetails(response: CourseDetailsResponse) {
        guard
            let courseName = response.courseName,
            let numberOfLessons = response.numberOfLessons,
            let numberOfTests = response.numberOfTests,
            let imageData = response.imageData
        else { return }
        
        let viewModel = CourseDetailsViewModel(
            courseName: courseName,
            numberOfLessons: "Number of lessons: \(numberOfLessons)",
            numberOfTests: "Number of tests: \(numberOfTests)",
            imageData: imageData,
            isFavorite: response.isFavorite
        )
        viewController?.displayCourseDetails(viewModel: viewModel)
    }
    
    func presentFavoriteStatus(response: CourseStatusResponse) {
        let viewModel = CourseStatusViewModel(isFavorite: response.isFavorite)
        viewController?.displayFavoriteButtonStatus(viewModel: viewModel)
    }
}