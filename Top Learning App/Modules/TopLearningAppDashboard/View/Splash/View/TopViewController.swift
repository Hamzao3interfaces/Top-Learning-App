//
//  ViewController.swift
//  Top Learning App
//
//  Created by Hamza Sikandar on 25/08/2025.
//

import UIKit

class TopViewController: UIViewController {
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        label.textColor = .black
        label.font = .systemFont(ofSize: 35, weight: .light)
        label.textAlignment = .center
        return label
    }()
    private let bookimageview: UIImageView = {
        let bookimage = UIImageView()
        bookimage.image = UIImage(named: "Books")?.withRenderingMode(.alwaysTemplate)
        bookimage.tintColor = .blue
        bookimage.contentMode = .scaleAspectFit
        return bookimage
    }()
    private let toplabel: UILabel = {
        let label = UILabel()
        label.text = "TOP"
        label.textColor = .black
        label.font = .systemFont(ofSize: 50, weight: .light)
        label.textAlignment = .center
        return label
    }()
    private let learnlabel: UILabel = {
        let label = UILabel()
        label.text = "LEARNING"
        label.textColor = .white
        label.font = .systemFont(ofSize: 50, weight: .bold)
        label.textAlignment = .center
        return label
    }()
    private lazy var continueButton: UIButton = {
        let button = UIButton()
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(.mediumSlateBlue, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 22.5
        button.clipsToBounds = true
        button.titleLabel?.font = .systemFont(ofSize: 25, weight: .medium)
        button.addTarget(self, action: #selector(navigateToCourse), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupviews()
    }
    private func setupviews(){
        view.backgroundColor = .mediumSlateBlue
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        [welcomeLabel, bookimageview, toplabel, learnlabel, continueButton].forEach{ items in
            view.addSubview(items)
            items.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            welcomeLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:20),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:-20),
            
            bookimageview.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 60),
            bookimageview.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            bookimageview.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            bookimageview.heightAnchor.constraint(equalToConstant: 200),
            
            toplabel.topAnchor.constraint(equalTo: bookimageview.bottomAnchor, constant: -30),
            toplabel.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            toplabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            
            learnlabel.topAnchor.constraint(equalTo: toplabel.bottomAnchor, constant: -23),
            learnlabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            learnlabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            continueButton.topAnchor.constraint(equalTo: learnlabel.bottomAnchor, constant: 250),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35),
            continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -35),
            continueButton.heightAnchor.constraint(equalToConstant: 45),
            
        ])
    }
    @objc func navigateToCourse(){
        let vc = CoursesViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
