//
//  AppsPageHeader.swift
//  AppStoreJSONApis
//
//  Created by kashee on 15/01/24.
//

import UIKit

class AppsPageHeader: UICollectionReusableView {
    
    static var identifier: String {
        get {
           "AppsPageHeader"
        }
    }
    
    let appHeaderHorizontalController = AppsHeaderHorizontalController()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(appHeaderHorizontalController.view)
        appHeaderHorizontalController.view.fillSuperview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
