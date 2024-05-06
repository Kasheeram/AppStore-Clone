//
//  TodayItem.swift
//  AppStoreJSONApis
//
//  Created by kashee on 30/01/24.
//

import UIKit


struct TodayItem {
    
    let category: String
    let title: String
    let image: UIImage
    let description: String
    let backgroundColor: UIColor
    
    
    // enum
    let cellType: CellType
    
    let apps: [FeedResult]
    
    enum CellType: String {
        case single, multiple
    }
}
