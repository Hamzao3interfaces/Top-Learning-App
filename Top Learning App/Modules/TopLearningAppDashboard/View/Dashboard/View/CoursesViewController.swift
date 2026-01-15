//
//  CoursesViewController.swift
//  Top Learning App
//
//  Created by Hamza Sikandar on 25/08/2025.
//

import UIKit

class CoursesViewController: UIViewController {
    
    private let navigateView = UIView()
    private let helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello,User!"
        label.textColor = .blue
        label.font = .systemFont(ofSize: 30, weight: .light)
        return label
    }()
    private let startLabel: UILabel = {
        let label = UILabel()
        label.text = "Start a new Course"
        label.textColor = .blue
        label.font = .systemFont(ofSize: 35, weight: .medium)
        return label
    }()
    private let searchBar : UISearchBar = {
        let search = UISearchBar()
        search.placeholder = "Search a Course"
        search.isUserInteractionEnabled = false
        search.layer.borderColor = UIColor.mediumSlateBlue.cgColor
        search.layer.borderWidth = 3
        return search
    }()
    private let categoryLabel: UILabel = {
        let label = UILabel()
        label.text = "Categories"
        label.font = .systemFont(ofSize: 30, weight: .light)
        label.textColor = .black
        return label
    }()
    private lazy var categoryCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collView.delegate = self
        collView.dataSource = self
        collView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: CategoryCollectionViewCell.reuseidentifer)
        collView.showsHorizontalScrollIndicator = false
        collView.layer.cornerRadius = 25
        collView.clipsToBounds = true
        collView.backgroundColor = .clear
        return collView
    }()
    private let dividerview: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    private let coursesLabel: UILabel = {
        let label = UILabel()
        label.text = "Most Popular Courses"
        label.font = .systemFont(ofSize: 25, weight: .light)
        label.textColor = .white
        return label
    }()
    private let courseCard1 = CustomCourseCard(
        image: "camera",
        courseName: "Top Course 01",
        rating: "5.0")
    private let courseCard2 = CustomCourseCard(
        image: "camera",
        courseName: "Top Course 02",
        rating: "4.7")
    let button1 = UIButton()
    let techButton = UIButton()
    let nonTechButton = UIButton()
    
    private var viewModel = CoursesDataViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupview()
        
       // viewModel.onDataChanged = {
       //     self.categoryCollectionView.reloadData()
        //}
        
        viewModel.moveToControllerA = {
            self.navigationController?.pushViewController(AViewController(), animated: true)
        }
        
        viewModel.moveToControllerB = {
            self.navigationController?.pushViewController(BViewController(), animated: true)
        }
        
        viewModel.didFiltered = {
            self.categoryCollectionView.reloadData()
        }
    
        
}
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    private func setupview(){
        view.backgroundColor = .mediumSlateBlue
        navigateView.backgroundColor = .white
        button1.backgroundColor = .red
        button1.setTitle("Move", for: .normal)
        button1.addTarget(self, action: #selector(moveToNextVc), for: .touchUpInside)
        techButton.backgroundColor = .green
        techButton.setTitleColor(.red, for: .normal)
        techButton.setTitle("Tech", for: .normal)
        techButton.addTarget(self, action: #selector(didTapTech), for: .touchUpInside)
        nonTechButton.addTarget(self, action: #selector(didTapNonTech), for: .touchUpInside)
        nonTechButton.setTitleColor(.white, for: .normal)
        nonTechButton.backgroundColor = .black
        nonTechButton.setTitle("NonTech", for: .normal)
        
        [navigateView, categoryLabel, categoryCollectionView, dividerview, coursesLabel, courseCard1, courseCard2, techButton, nonTechButton].forEach{ items in
            view.addSubview(items)
            items.translatesAutoresizingMaskIntoConstraints = false
        }
        [helloLabel, startLabel, searchBar, button1].forEach { items in
            navigateView.addSubview(items)
            items.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            
            navigateView.topAnchor.constraint(equalTo: view.topAnchor),
            navigateView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigateView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigateView.heightAnchor.constraint(equalToConstant: 350),
            
            button1.topAnchor.constraint(equalTo: navigateView.topAnchor, constant: 50),
            button1.leadingAnchor.constraint(equalTo: navigateView.leadingAnchor, constant: 10),
            button1.widthAnchor.constraint(equalToConstant: 140),
            button1.heightAnchor.constraint(equalToConstant: 50),
            
            techButton.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            techButton.leadingAnchor.constraint(equalTo: searchBar.leadingAnchor, constant: 10),
            techButton.widthAnchor.constraint(equalToConstant: 140),
            techButton.heightAnchor.constraint(equalToConstant: 50),
            
            nonTechButton.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 10),
            nonTechButton.trailingAnchor.constraint(equalTo: searchBar.trailingAnchor, constant: -10),
            nonTechButton.widthAnchor.constraint(equalToConstant: 140),
            nonTechButton.heightAnchor.constraint(equalToConstant: 50),

            
            helloLabel.topAnchor.constraint(equalTo: navigateView.safeAreaLayoutGuide.topAnchor, constant: 60),
            helloLabel.leadingAnchor.constraint(equalTo: navigateView.leadingAnchor, constant: 20),
            
            startLabel.topAnchor.constraint(equalTo: helloLabel.safeAreaLayoutGuide.bottomAnchor, constant: 5),
            startLabel.leadingAnchor.constraint(equalTo: navigateView.leadingAnchor, constant: 20),
            
            searchBar.topAnchor.constraint(equalTo: startLabel.bottomAnchor, constant: 20),
            searchBar.leadingAnchor.constraint(equalTo: navigateView.leadingAnchor, constant: 20),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            searchBar.heightAnchor.constraint(equalToConstant: 55),
            
            categoryLabel.topAnchor.constraint(equalTo: navigateView.bottomAnchor, constant: 25),
            categoryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            categoryCollectionView.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 8),
            categoryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            categoryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoryCollectionView.heightAnchor.constraint(equalToConstant: 120),
            
            dividerview.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor, constant: 5),
            dividerview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dividerview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            dividerview.heightAnchor.constraint(equalToConstant: 2),
            
            coursesLabel.topAnchor.constraint(equalTo: dividerview.bottomAnchor, constant: 15),
            coursesLabel.leadingAnchor.constraint(equalTo: dividerview.leadingAnchor, constant: 20),
            
            courseCard1.topAnchor.constraint(equalTo: coursesLabel.bottomAnchor, constant: 15),
            courseCard1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            courseCard1.widthAnchor.constraint(equalToConstant: 140),
            courseCard1.heightAnchor.constraint(equalToConstant: 180),
            
            courseCard2.topAnchor.constraint(equalTo: coursesLabel.bottomAnchor, constant: 15),
            courseCard2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            courseCard2.widthAnchor.constraint(equalToConstant: 140),
            courseCard2.heightAnchor.constraint(equalToConstant: 170),
            
            
            
        ])
    } 
    @objc func moveToNextVc() {
       viewModel.generateAndCheckRandomNumber()
    }
    @objc func didTapTech() {
      viewModel.filterSubjectsByType(type: "tech")
  }
    @objc func didTapNonTech() {
        viewModel.filterSubjectsByType(type: "non-tech")
        }
}
extension CoursesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.filterSubjects.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.reuseidentifer, for: indexPath) as! CategoryCollectionViewCell
        let data = viewModel.filterSubjects[indexPath.row]
        cell.configure(model: data)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90, height: 80)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 12
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = viewModel.filterSubjects[indexPath.row]
        let vc = IntroductionViewController()
        vc.category = data.categoryName
        self.navigationController?.pushViewController(vc, animated: true)
        }
    }

    
    

class AViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

class BViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
