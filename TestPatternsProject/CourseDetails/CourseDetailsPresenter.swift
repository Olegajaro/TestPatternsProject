//
//  CourseDetailsPresenter.swift
//  TestPatternsProject
//
//  Created by Олег Федоров on 18.12.2021.
//

import Foundation

struct CourseDetailsData {
    
}

class CourseDetailsPresenter: CourseDetailsViewOutputProtocol {
    
    unowned let view: CourseDetailsViewInputProtocol
    var interactor: CourseDetailsInteractorInputProtocol!
    
    required init(view: CourseDetailsViewInputProtocol) {
        self.view = view
    }
    
    func showDetails() {
        
    }
}

// MARK: - CourseDetailsInteractorOutputProtocol

extension CourseDetailsPresenter: CourseDetailsInteractorOutputProtocol {
    
}
