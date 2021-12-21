//
//  CourseListConfigurator.swift
//  TestPatternsProject
//
//  Created by Олег Федоров on 21.12.2021.
//

import Foundation

protocol CourseListConfiguratorInputProtocol {
    func configure(with view: CourseListViewController)
}

class CourseListConfigurator: CourseListConfiguratorInputProtocol {
    func configure(with viewController: CourseListViewController) {
        let presenter = CourseListPresenter(view: viewController)
        let interactor = CourseListInteractor(presenter: presenter)
        let router = CourseListRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
}
