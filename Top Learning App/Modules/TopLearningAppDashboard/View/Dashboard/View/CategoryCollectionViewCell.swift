//
//  CategoryCollectionViewCell.swift
//  Top Learning App
//
//  Created by Hamza Sikandar on 26/08/2025.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    static let reuseidentifer = "CategoryCollectionViewCell"

    private let cardView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 20
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 10, weight: .medium)
        lbl.textColor = .black
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    private let iconImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit
        img.tintColor = .systemIndigo
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .white
        setupUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        contentView.layer.cornerRadius = 15
        contentView.clipsToBounds = true
        contentView.addSubview(cardView)
        cardView.addSubview(titleLabel)
        cardView.addSubview(iconImageView)
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            cardView.heightAnchor.constraint(equalToConstant: 80),
            
            titleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 5),
            titleLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 20),
            titleLabel.widthAnchor.constraint(equalToConstant: 40),
            
            iconImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            iconImageView.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            iconImageView.widthAnchor.constraint(equalToConstant: 40),
            iconImageView.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    func configure(model: AllSubjects) {
        titleLabel.text = model.categoryName
        iconImageView.image = UIImage(systemName: model.categoryImage)
    }
}


