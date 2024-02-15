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
    
    public static func fetchMeal(id: String) -> AnyPublisher<MealDetail, Never> {
        let mealEndpoint = MeadDbEndpoint(path: "/api/json/v1/1/lookup.php", queryItems: [URLQueryItem(name: "i", value: id)])
        
        return URLSession.shared.dataTaskPublisher(for: mealEndpoint.url!)
            .map(\.data)
            .decode(type: MealDetailWrapper.self, decoder: JSONDecoder())
            .map { $0.meals.first ?? MealDetail(instructions: "") }
            .replaceError(with: MealDetail(instructions: ""))
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}


public extension String {
    func decodeJSON<T>(_ type: T.Type) -> T? where T : Decodable {
        if let data = self.data(using: .utf8) {
            return try? JSONDecoder().decode(type, from: data)
        }
        
        return nil
    }
}

