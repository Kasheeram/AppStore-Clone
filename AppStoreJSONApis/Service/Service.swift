//
//  Service.swift
//  AppStoreJSONApis
//
//  Created by kashee on 13/01/24.
//

import Foundation

class Service {
    
    static let shared = Service()
    
    private init() {}
    
    func fetchApps<T: Decodable>(searchTerm: String, completion: @escaping(Result<T, Error>) -> ()) {
        let urlString = "https://itunes.apple.com/search?term=\(searchTerm)&entity=software"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchTopGrossing<T: Decodable>(completion: @escaping(Result<T, Error>) -> ()) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/apps/top-free/50/apps.json"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchGames<T: Decodable>(completion: @escaping(Result<T, Error>) -> ()) {
        let urlString = "https://rss.applemarketingtools.com/api/v2/us/books/top-paid/10/books.json"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchAppGroups<T: Decodable>(urlString: String, completion: @escaping(Result<T, Error>) -> ()) {
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchSocialApps<T: Decodable>(completion: @escaping(Result<T, Error>) -> Void) {
        let urlString = "https://api.letsbuildthatapp.com/appstore/social"
        fetchGenericJSONData(urlString: urlString, completion: completion)
    }
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, completion: @escaping(Result<T, Error>) -> ()) {
        guard let url = URL(string: urlString) else { return }
        
        // fetch data from internet
        URLSession.shared.dataTask(with: url) { data, resp, err in
            if let err = err {
                print("Failed to fetch apps:", err)
                return
            }
            
            // success
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
//                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let searchResult = try decoder.decode(T.self, from: data)
                completion(.success(searchResult))
                
            } catch {
                print(error)
                completion(.failure(error))
            }
            
            
        }.resume() // fire off the request
    }
}

