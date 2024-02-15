//
//  MealDbAPI.swift
//  TheMealDb
//
//  Created by Mark Schall on 2/15/24.
//

import Foundation
import Combine

struct MeadDbEndpoint {
    let path: String
    let queryItems: [URLQueryItem]
    
    var url: URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "themealdb.com"
        components.path = path
        components.queryItems = queryItems
        
        return components.url
    }
}

struct MealDbAPI {
    
    public static func fetchCategory(category: String) -> AnyPublisher<MealIndexList, Never> {
        let categoryEndpoint = MeadDbEndpoint(path: "/api/json/v1/1/filter.php", queryItems: [URLQueryItem(name: "c", value: category)])
        
        return URLSession.shared.dataTaskPublisher(for: categoryEndpoint.url!)
            .map(\.data)
            .decode(type: MealIndexList.self, decoder: JSONDecoder())
            .replaceError(with: MealIndexList(meals: []))
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}

