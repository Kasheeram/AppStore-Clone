//
//  AppGroup.swift
//  AppStoreJSONApis
//
//  Created by kashee on 15/01/24.
//

import Foundation


struct AppGroup: Decodable {
    let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [FeedResult]
}

struct FeedResult: Decodable {
    let id, name, artistName, artworkUrl100: String
}
