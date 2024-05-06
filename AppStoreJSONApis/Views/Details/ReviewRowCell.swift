//
//  ReviewRowCell.swift
//  AppStoreJSONApis
//
//  Created by kashee on 21/01/24.
//

import UIKit

class ReviewRowCell: UICollectionViewCell {
    
    static let identifier = "ReviewRowCell"
    
    let reviewController = ReviewsController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .yellow
        addSubview(reviewController.view)
        reviewController.view.fillSuperview()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
