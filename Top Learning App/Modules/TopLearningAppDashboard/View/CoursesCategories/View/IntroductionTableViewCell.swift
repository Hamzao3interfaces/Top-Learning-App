//
//  IntroductionTableViewCell.swift
//  Top Learning App
//
//  Created by Hamza Sikandar on 27/08/2025.
//

import UIKit

class IntroductionTableViewCell: UITableViewCell {
    
    static let reuseidentifier = "IntroductionTableViewCell"
    private let cardView: UIView = {
        let view = UIView()
        view.backgroundColor = .mediumSlateBlue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let lessonLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let autorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .semibold)
        label.textColor = .white
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let circleimage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupview()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupview(){
        contentView.addSubview(cardView)
        cardView.addSubview(numberLabel)
        cardView.addSubview(lessonLabel)
        cardView.addSubview(autorLabel)
        cardView.addSubview(circleimage)
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cardView.heightAnchor.constraint(equalToConstant: 60),
            
            numberLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
            numberLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 20),
            
            lessonLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 5),
            lessonLabel.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
            lessonLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            
            autorLabel.topAnchor.constraint(equalTo: lessonLabel.bottomAnchor, constant: -15),
            autorLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 30),
            autorLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -30),
            
            circleimage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 10),
            circleimage.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -10),
        ])
    }
    func configure(model: AllLessons) {
        numberLabel.text = "\(model.id)"
        lessonLabel.text = model.title
        circleimage.image = UIImage(systemName: "circle.fill")
        
    }
}
