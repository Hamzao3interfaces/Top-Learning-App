//
//  IntroductionViewController.swift
//  Top Learning App
//
//  Created by Hamza Sikandar on 27/08/2025.
//

import UIKit

class IntroductionViewController: UIViewController {
    
    private let navigationView: UIView = {
        let view = UIView()
        return view
    }()
    private let iconimage: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(systemName: "camera")
        icon.tintColor = .systemBlue
        icon.contentMode = .scaleAspectFit
        return icon
    }()
    private let introLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 30, weight: .regular)
        return label
    }()
    private lazy var tableview: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.register(IntroductionTableViewCell.self, forCellReuseIdentifier: IntroductionTableViewCell.reuseidentifier)
        table.showsVerticalScrollIndicator = true
        table.backgroundColor = .clear
        return table
    }()
    private var viewModel = CoursesDataViewModel()
    var lessonsData: [AllLessons] = []
    var category: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupview()
    }
    
    private func setupview(){
        view.backgroundColor = .mediumSlateBlue
        navigationView.backgroundColor = .white
        introLabel.text = "Introduction of \(category ?? "Coding")"
        self.navigationController?.isNavigationBarHidden = false
        loadAllLessons()
        
        [navigationView, introLabel, tableview].forEach { item in
            view.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        [iconimage].forEach{ item in
            navigationView.addSubview(item)
            item.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate([
            navigationView.topAnchor.constraint(equalTo: view.topAnchor),
            navigationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navigationView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            navigationView.heightAnchor.constraint(equalToConstant: 350),
            
            iconimage.centerYAnchor.constraint(equalTo: navigationView.centerYAnchor),
            iconimage.centerXAnchor.constraint(equalTo: navigationView.centerXAnchor),
            iconimage.heightAnchor.constraint(equalToConstant: 250),
            iconimage.widthAnchor.constraint(equalToConstant: 150),
            
            introLabel.topAnchor.constraint(equalTo: navigationView.bottomAnchor, constant: 25),
            introLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            tableview.topAnchor.constraint(equalTo: introLabel.bottomAnchor, constant: 15),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableview.heightAnchor.constraint(equalToConstant: 250)
        ])
    }
    private func loadAllLessons() {
        lessonsData = viewModel.getLessonsByCategory(category: category ?? "Coding")
    }
}
extension IntroductionViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lessonsData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: IntroductionTableViewCell.reuseidentifier, for: indexPath) as! IntroductionTableViewCell
        let data = lessonsData[indexPath.row]
        cell.configure(model: data)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let data = lessonsData[indexPath.row]
        let vc = DetailsViewController()
        vc.categoryName = category ?? "Coding"
        vc.lessonTitle = data.title
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
