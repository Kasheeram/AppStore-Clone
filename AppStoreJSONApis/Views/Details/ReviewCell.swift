//
//  ReviewCell.swift
//  AppStoreJSONApis
//
//  Created by kashee on 21/01/24.
//

import UIKit


class ReviewCell: UICollectionViewCell {
    
    static let identifier = "ReviewCell"
    
    let titleLabel = UILabel(text: "Review Title", font: .boldSystemFont(ofSize: 18))
    let autherLabel = UILabel(text: "Auther", font: .systemFont(ofSize: 16))
    let starsLabel = UILabel(text: "Stars", font: .systemFont(ofSize: 14))
    
    let starsStackView: UIStackView = {
        var arrangedSubviews = [UIView]()
        (0...5).forEach { _ in
            let imageView = UIImageView(image: #imageLiteral(resourceName: "star"))
            imageView.constrainWidth(constant: 24)
            imageView.constrainHeight(constant: 24)
            arrangedSubviews.append(imageView)
        }
        arrangedSubviews.append(UIView())
        let stackView = UIStackView(arrangedSubviews: arrangedSubviews)
        return stackView
    }()
                                        
    
    let bodyLabel = UILabel(text: "Reivew body\nReview body\nReview body", font: .systemFont(ofSize: 18), numberOfLines: 5)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // #colorLiteral(
        // #imageLiteral(
        backgroundColor = #colorLiteral(red: 0.9459765553, green: 0.9410116076, blue: 0.9754855037, alpha: 1)
        layer.cornerRadius = 16
        clipsToBounds = true
      
        let stackView = VerticalStackView(arrangedSubviews: [
            UIStackView(arrangedSubviews: [titleLabel, autherLabel], customSpacing: 8),
            starsStackView,
            bodyLabel
        ], spacing: 12)
        titleLabel.setContentCompressionResistancePriority(.init(0), for: .horizontal)
        autherLabel.textAlignment = .right
        
        addSubview(stackView)
        stackView.anchor(top: topAnchor, leading: leadingAnchor, bottom: nil, trailing: trailingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 20))
//        stackView.fillSuperview(padding: .init(top: 20, left: 20, bottom: 20, right: 20))
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

