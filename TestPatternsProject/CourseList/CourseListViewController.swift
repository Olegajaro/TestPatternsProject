//
//  CourseListViewController.swift
//  TestPatternsProject
//
//  Created by Олег Федоров on 09.12.2021.
//

import UIKit

protocol CourseListViewControllerInputProtocol: AnyObject {
    func displayCourses(courses: [Course])
}

protocol CourseListViewControllerOutputProtocol: AnyObject {
    init(view: CourseListViewControllerInputProtocol)
    func viewDidLoad()
}

private let reuseIdentifier = "CourseCell"

class CourseListViewController: UITableViewController {

    // MARK: - Properties
    
    private var activityIndicator: UIActivityIndicatorView?
    private var courses: [Course] = []
    
    var presenter: CourseListViewControllerOutputProtocol!
    var configurator: CourseListConfiguratorInputProtocol = CourseListConfigurator()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configurator.configure(with: self)
        presenter.viewDidLoad()
        setupNavigationBar()
        configureTableView()
        activityIndicator = showActivityIndicator(in: view)
    }
    
    // MARK: - Actions
    
    // MARK: - Helpers
    
    private func setupNavigationBar() {
        title = "Courses"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .white
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        
        navBarAppearance.backgroundColor = UIColor(red: 21/255, green: 101/255,
                                                   blue: 192/255, alpha: 194/255)
        
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
    }
    
    private func configureTableView() {
        tableView.register(CourseCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.rowHeight = 100
    }
    
    private func showActivityIndicator(in view: UIView) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .black
        activityIndicator.startAnimating()
        activityIndicator.hidesWhenStopped = true
        
        view.addSubview(activityIndicator)
        activityIndicator.centerX(inView: view,
                                  topAnchor: view.safeAreaLayoutGuide.topAnchor,
                                  paddingTop: 300)
        
        return activityIndicator
    }
}

// MARK: - UITableViewDataSource

extension CourseListViewController {
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        courses.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: reuseIdentifier,
            for: indexPath
        ) as! CourseCell
        
        let course = courses[indexPath.row]
        cell.configure(with: course)
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension CourseListViewController {
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        let course = courses[indexPath.row]
        
        let controller = CourseDetailsViewController(course: course)
        
        navigationController?.pushViewController(controller, animated: true)
    }
}

// MARK: - CourseListViewControllerInputProtocol

extension CourseListViewController: CourseListViewControllerInputProtocol {
    func displayCourses(courses: [Course]) {
        self.courses = courses
        activityIndicator?.stopAnimating()
        tableView.reloadData()
    }
}
