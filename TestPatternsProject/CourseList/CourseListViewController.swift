//
//  CourseListViewController.swift
//  TestPatternsProject
//
//  Created by Олег Федоров on 09.12.2021.
//

import UIKit

protocol CourseListViewControllerInputProtocol: AnyObject {
    func reloadData(for section: CourseSectionViewModel)
}

protocol CourseListViewControllerOutputProtocol: AnyObject {
    init(view: CourseListViewControllerInputProtocol)
    func viewDidLoad()
    func didTapCell(at indexPath: IndexPath)
}

private let reuseIdentifier = "CourseCell"

class CourseListViewController: UITableViewController {

    // MARK: - Properties
    
    private var activityIndicator: UIActivityIndicatorView?
    private var sectionViewModel: CourseSectionViewModelProtocol = CourseSectionViewModel()
    
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
        tableView.register(CourseCell.self,
                           forCellReuseIdentifier: reuseIdentifier)
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
        sectionViewModel.rows.count
    }
    
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellViewModel = sectionViewModel.rows[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(
            withIdentifier: reuseIdentifier,
            for: indexPath
        ) as! CourseCell
        
        cell.viewModel = cellViewModel
        
        return cell
    }
}

// MARK: - UITableViewDelegate

extension CourseListViewController {
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter.didTapCell(at: indexPath)
    }
    
    override func tableView(_ tableView: UITableView,
                            heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(sectionViewModel.rows[indexPath.row].cellHeight)
    }
}

// MARK: - CourseListViewControllerInputProtocol

extension CourseListViewController: CourseListViewControllerInputProtocol {
    func reloadData(for section: CourseSectionViewModel) {
        sectionViewModel = section
        activityIndicator?.stopAnimating()
        tableView.reloadData()
    }
}
