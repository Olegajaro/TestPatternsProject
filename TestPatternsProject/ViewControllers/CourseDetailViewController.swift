//
//  CourseDetailViewController.swift
//  TestPatternsProject
//
//  Created by Олег Федоров on 09.12.2021.
//

import UIKit

class CourseDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var course: Course!
    
    private var isFavorite = false
    
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
        button.addTarget(self, action: #selector(handleFavoriteTap), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: - Lifecycle
    
    init(course: Course) {
        self.course = course
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadFavoriteStatus()
        setupUI()
    }
    
    // MARK: - Actions
    
    @objc private func handleFavoriteTap() {
        isFavorite.toggle()
        setStatusForFavoriteButton()
        StorageManager.shared.setFavoritesStatus(for: course?.name ?? "", with: isFavorite)
    }
    
    private func setStatusForFavoriteButton() {
        favoriteButton.tintColor = isFavorite ? .red : .gray
    }
    
    private func loadFavoriteStatus() {
        isFavorite = StorageManager.shared.getFavoriteStatus(for: course.name)
    }
    
    // MARK: - Helpers
    
    private func setupUI() {
        view.backgroundColor = .white
        
        view.addSubview(courseNameLabel)
        courseNameLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor,
                               right: view.rightAnchor, paddingTop: 100,
                               paddingLeft: 30, paddingRight: 30)
        courseNameLabel.textAlignment = .center
        
        view.addSubview(courseImage)
        courseImage.setDimensions(height: 250, width: view.frame.width - 60)
        courseImage.anchor(top: courseNameLabel.bottomAnchor, paddingTop: 16)
        courseImage.centerX(inView: view)
        
        view.addSubview(favoriteButton)
        favoriteButton.setDimensions(height: 50, width: 50)
        favoriteButton.anchor(bottom: courseImage.bottomAnchor, right: courseImage.rightAnchor,
                              paddingBottom: 0, paddingRight: 0)
        
        let stack = UIStackView(arrangedSubviews: [numberOfLessons, numberOfTests])
        stack.axis = .vertical
        stack.spacing = 10
        stack.alignment = .leading
        
        view.addSubview(stack)
        stack.anchor(top: courseImage.bottomAnchor, left: view.leftAnchor,
                     right: view.rightAnchor, paddingTop: 20,
                     paddingLeft: 30, paddingRight: 30)
        
        configure()
    }
    
    private func configure() {
        courseNameLabel.text = course.name
        numberOfLessons.text = "Number of lessons: \(course.numberOfLessons)"
        numberOfTests.text = "Number of tests: \(course.numberOfTests)"
        
        if let imageData = ImageManager.shared.fetchImageData(from: course.imageURL) {
            courseImage.image = UIImage(data: imageData)
        }
        
        setStatusForFavoriteButton()
    }
}
