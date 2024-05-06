//
//  AppRowCell.swift
//  AppStoreJSONApis
//
//  Created by kashee on 15/01/24.
//

import UIKit

class AppRowCell: UICollectionViewCell {
    
    static var identifier: String {
        get {
            "AppRowCell"
        }
    }
    
    let imageView = UIImageView(cornerRadius: 8)
    
    
    let nameLabel = UILabel(text: "App Name", font: .systemFont(ofSize: 20))
    let companyLabel = UILabel(text: "Company Name", font: .systemFont(ofSize: 13))
    let getButton = UIButton(title: "Get")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let stackView = UIStackView(arrangedSubviews: [
            imageView, VerticalStackView(arrangedSubviews: [nameLabel, companyLabel], spacing: 4), getButton
        ])
        
        imageView.constrainWidth(constant: 64)
        imageView.constrainHeight(constant: 64)
        
        getButton.backgroundColor = UIColor(white: 0.95, alpha: 1)
        getButton.constrainWidth(constant: 80)
        getButton.constrainHeight(constant: 32)
        getButton.layer.cornerRadius = 32 / 2
        getButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        addSubview(stackView)
        stackView.fillSuperview()
        stackView.spacing = 16
        stackView.alignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
