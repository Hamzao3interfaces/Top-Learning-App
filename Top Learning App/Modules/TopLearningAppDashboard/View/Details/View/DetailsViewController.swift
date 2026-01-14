//
//  DetailsViewController.swift
//  Top Learning App
//
//  Created by Hamza Sikandar on 28/08/2025.
//

import UIKit

class DetailsViewController: UIViewController {
    
    var categoryName = String()
    var lessonTitle = String()
    private  let detailLabel = UILabel()
    let viewModel = CoursesDataViewModel()
    var detailsData: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "\(categoryName) \(lessonTitle)"
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = .mediumSlateBlue
        view.addSubview(detailLabel)
        detailLabel.translatesAutoresizingMaskIntoConstraints = false
        detailLabel.text =  viewModel.getDescriptionByLesson(categoryName: categoryName, lessonTitle: lessonTitle)
        detailLabel.textColor = .black
        
        NSLayoutConstraint.activate([
            detailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            detailLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100)
            
        ])
    }
}
