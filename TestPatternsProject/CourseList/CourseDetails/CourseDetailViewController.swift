//
//  CourseDetailsViewController.swift
//  TestPatternsProject
//
//  Created by Олег Федоров on 09.12.2021.
//

import UIKit

protocol CourseDetailsViewInputProtocol: AnyObject {
    func displayCourseName(with title: String)
    func displayNumberOfLessons(with title: String)
    func displayNumberOfTests(with title: String)
    func displayCourseImage(with data: Data)
    func displayImageForFavoriteButton(with state: Bool)
}

protocol CourseDetailsViewOutputProtocol: AnyObject {
    init(view: CourseDetailsViewInputProtocol)
    func showDetails()
    func favoriteButtonPressed()
}

class CourseDetailsViewController: UIViewController {
    
    // MARK: - Properties
    
    var presenter: CourseDetailsViewOutputProtocol!
    let configurator: CourseDetailsConfiguratorInputProtocol = CourseDetailsConfigurator()
    
    private var courseNameLabel: UILabel =  {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .medium)
        label.numberOfLines = 0
        return label
    }()
    
    private var courseImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.backgroundColor = .systemGray
        return iv
    }()
    
    private var numberOfLessons: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private var numberOfTests: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    private var favoriteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        button.addTarget(self,
                         action: #selector(handleFavoriteTap),
                         for: .touchUpInside)
        button.setPreferredSymbolConfiguration(
            UIImage.SymbolConfiguration(pointSize: 30),
            forImageIn: .normal
        )
        return button
    }()
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.showDetails()
        setupUI()
    }
    
    // MARK: - Actions
    
    @objc private func handleFavoriteTap() {
        presenter.favoriteButtonPressed()
    }
    
    // MARK: - Helpers
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(courseNameLabel)
        courseNameLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                               left: view.leftAnchor, right: view.rightAnchor,
                               paddingTop: 100, paddingLeft: 30,
                               paddingRight: 30)
        courseNameLabel.textAlignment = .center
        
        view.addSubview(courseImage)
        courseImage.setDimensions(height: 250, width: view.frame.width - 60)
        courseImage.anchor(top: courseNameLabel.bottomAnchor, paddingTop: 16)
        courseImage.centerX(inView: view)
        
        view.addSubview(favoriteButton)
        favoriteButton.setDimensions(height: 50, width: 50)
        favoriteButton.anchor(bottom: courseImage.bottomAnchor,
                              right: courseImage.rightAnchor,
                              paddingBottom: 0, paddingRight: 0)
        
        let stack = UIStackView(arrangedSubviews: [numberOfLessons,
                                                   numberOfTests])
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .leading
        
        view.addSubview(stack)
        stack.anchor(top: courseImage.bottomAnchor, left: view.leftAnchor,
                     right: view.rightAnchor, paddingTop: 20,
                     paddingLeft: 30, paddingRight: 30)
    }
}

// MARK: - CourseDetailsViewInputProtocol

extension CourseDetailsViewController: CourseDetailsViewInputProtocol {
    func displayCourseName(with title: String) {
        courseNameLabel.text = title
    }
    
    func displayNumberOfLessons(with title: String) {
        numberOfLessons.text = title
    }
    
    func displayNumberOfTests(with title: String) {
        numberOfTests.text = title
    }
    
    func displayCourseImage(with data: Data) {
        courseImage.image = UIImage(data: data)
    }
    
    func displayImageForFavoriteButton(with state: Bool) {
        favoriteButton.tintColor = state ? .red : .gray
    }
}
