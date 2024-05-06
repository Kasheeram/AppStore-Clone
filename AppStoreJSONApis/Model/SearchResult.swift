//
//  SearchResult.swift
//  AppStoreJSONApis
//
//  Created by kashee on 13/01/24.
//

import Foundation


struct SearchResult: Decodable {
    let resultCount: Int
    let results: [Results]
}

struct Results: Decodable {
    let trackId: Int
    let trackName: String
    let primaryGenreName: String?
    var averageUserRating: Float?
    let artworkUrl100: String // app icon
    let screenshotUrls: [String]? // optional
    let formattedPrice: String?
    let description: String?
    let releaseNotes: String?
}

