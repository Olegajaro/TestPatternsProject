//
//  CourseListViewController.swift
//  TestPatternsProject
//
//  Created by Олег Федоров on 09.12.2021.
//

import UIKit

private let reuseIdentifier = "CourseCell"

class CourseListViewController: UITableViewController {

    // MARK: - Properties
    
    private var activityIndicator: UIActivityIndicatorView?
    private var viewModel: CourseListViewModelProtocol! {
        didSet {
            viewModel.fetchCourses {
                self.tableView.reloadData()
                self.activityIndicator?.stopAnimating()
            }
        }
    }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel = CourseListViewModel()
        setupNavigationBar()
        configureTableView()
        activityIndicator = showActivityIndicator(in: view)
    }
    
    // MARK: - Helpers
    
    private func setupNavigationBar() {
        title = "Courses"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.tintColor = .white
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        
        navBarAppearance.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        
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
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: reuseIdentifier,
            for: indexPath
        ) as! CourseCell
        
        cell.viewModel = viewModel.cellViewModel(at: indexPath)
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension CourseListViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = CourseDetailsViewController(viewModel.detailsViewModel(at: indexPath))
        
        navigationController?.pushViewController(controller, animated: true)
    }
}
