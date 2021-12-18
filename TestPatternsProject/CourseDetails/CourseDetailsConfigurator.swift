//
//  CourseDetailsConfigurator.swift
//  TestPatternsProject
//
//  Created by Олег Федоров on 18.12.2021.
//

import Foundation

protocol CourseDetailsConfiguratorInputProtocol {
    func configure(with view: CourseDetailsViewController, and course: Course)
}

class CourseDetailsConfigurator: CourseDetailsConfiguratorInputProtocol {
    func configure(with view: CourseDetailsViewController, and course: Course) {
        let presenter = CourseDetailsPresenter(view: view)
        let interactor = CourseDetailsInteractor(presenter: presenter, course: course)
        
        view.presenter = presenter
        presenter.interactor = interactor
    }
}
