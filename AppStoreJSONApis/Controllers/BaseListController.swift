//
//  BaseListController.swift
//  AppStoreJSONApis
//
//  Created by kashee on 15/01/24.
//

import UIKit


class BaseListController: UICollectionViewController {
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
