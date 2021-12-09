//
//  CourseCell.swift
//  TestPatternsProject
//
//  Created by Олег Федоров on 09.12.2021.
//

import UIKit

class CourseCell: UITableViewCell {
    
    // MARK: - Properties
    
    var viewModel: CourseCellViewModelProtocol! {
        didSet {
            courseName.text = viewModel.courseName
            guard let imageData = viewModel.imageData else { return }
            courseImage.image = UIImage(data: imageData)
        }
    }
    
    private let courseImage: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .red
        iv.image = UIImage(systemName: "person.fill")
        return iv
    }()
    
    private let courseName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.numberOfLines = 2
        label.text = "Course name"
        return label
    }()
    
    // MARK: - Lifecycle
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(courseImage)
        courseImage.setDimensions(height: 100, width: 150)
        courseImage.centerY(inView: self, leftAnchor: leftAnchor, paddingLeft: 0)
        
        addSubview(courseName)
        courseName.centerY(inView: self, leftAnchor: courseImage.rightAnchor, paddingLeft: 10)
        courseName.anchor(right: self.rightAnchor, paddingRight: 10)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
