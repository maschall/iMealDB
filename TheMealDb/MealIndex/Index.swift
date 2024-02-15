//
//  Index.swift
//  TheMealDb
//
//  Created by Mark Schall on 2/14/24.
//

import Foundation

public struct MealIndexList: Codable {
    public var meals: [MealIndex]
}

public struct MealIndex: Codable {
    public var name: String
    public var thumbnailURL: String
    public var id: String
    
    private enum CodingKeys: String, CodingKey {
        case name = "strMeal",
             thumbnailURL = "strMealThumb",
             id = "idMeal"
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
