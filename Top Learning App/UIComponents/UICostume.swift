//
//  CustomCourseCard.swift
//  MVVM Practice app
//
//  Created by Hamza Sikandar on 26/08/2025.
//

import UIKit

class CustomCourseCard: UIView {

     let iconImageView = UIImageView()
     let courseNameLabel = UILabel()
     let ratingLabel = UILabel()
    
    init(image: String, courseName: String, rating: String) {
        super.init(frame: .zero)
        setupViews(image: image, name: courseName, rating: rating)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews(image: String, name: String, rating: String) {
        self.layer.cornerRadius = 12
        self.backgroundColor = .clear
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.1
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowRadius = 4
        self.layer.masksToBounds = false
        
        
        [iconImageView, courseNameLabel, ratingLabel].forEach { item in
            self.addSubview(item)
        }
        
        iconImageView.image = UIImage(systemName: image)
        iconImageView.tintColor = .systemBlue
        iconImageView.contentMode = .center
        iconImageView.backgroundColor = .white
        iconImageView.layer.cornerRadius = 15
        iconImageView.clipsToBounds = true
        iconImageView.translatesAutoresizingMaskIntoConstraints = false
        
        courseNameLabel.text = name
        courseNameLabel.font = UIFont.boldSystemFont(ofSize: 16)
        courseNameLabel.textAlignment = .center
        courseNameLabel.textColor = .white
        courseNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        ratingLabel.text = "✭ \(rating) rating"
        ratingLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        ratingLabel.textAlignment = .center
        ratingLabel.textColor = .white
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            iconImageView.topAnchor.constraint(equalTo: self.topAnchor),
            iconImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            iconImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            iconImageView.heightAnchor.constraint(equalToConstant: 130),
            
            courseNameLabel.topAnchor.constraint(equalTo: iconImageView.bottomAnchor),
            courseNameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            courseNameLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            
            ratingLabel.topAnchor.constraint(equalTo: courseNameLabel.bottomAnchor),
            ratingLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 5),
            ratingLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5),
        ])
    }
}
