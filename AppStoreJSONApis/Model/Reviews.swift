//
//  Reviews.swift
//  AppStoreJSONApis
//
//  Created by kashee on 21/01/24.
//

import UIKit

class Reviews: Decodable {
    let feed: ReviewFeed
}

struct ReviewFeed: Decodable {
    let entry: [Entry]
}

struct Entry: Decodable {
    let author: Author
    let title: Label
    let content: Label
    let rating: Label
    
    private enum CodingKeys: String, CodingKey {
        case author, title, content
        case rating = "im:rating"
    }
}

struct Author: Decodable {
    let name: Label
    let uri: Label
}

struct Label: Decodable {
    let label: String
}
