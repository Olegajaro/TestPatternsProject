//
//  CourseListViewController.swift
//  TestPatternsProject
//
//  Created by Олег Федоров on 09.12.2021.
//

import UIKit

class CourseListViewController: UITableViewController {

    // MARK: - Properties
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        setupNavigationBar()
    }
    
    // MARK: - Actions
    
    // MARK: - Helpers
    
    private func setupNavigationBar() {
        title = "Courses"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navBarAppearance = UINavigationBarAppearance()
        
        navBarAppearance.backgroundColor = UIColor(red: 21/255, green: 101/255,
                                                   blue: 192/255, alpha: 194/255)
        
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
}

