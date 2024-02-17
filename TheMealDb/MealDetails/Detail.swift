//
//  Detail.swift
//  TheMealDb
//
//  Created by Mark Schall on 2/15/24.
//

import Foundation

public struct MealDetailWrapper: Decodable {
    public var meals: [MealDetail]
}

public struct MealDetail: Decodable {
    public var instructions: String = ""
    public var ingredients: [IngredientModel] = []
    
    private enum CodingKeys: String, CodingKey {
        case instructions = "strInstructions"
        
        // I wish there was a better way of doing this
        case ingredient1 = "strIngredient1"
        case ingredient2 = "strIngredient2"
        case ingredient3 = "strIngredient3"
        case ingredient4 = "strIngredient4"
        case ingredient5 = "strIngredient5"
        case ingredient6 = "strIngredient6"
        case ingredient7 = "strIngredient7"
        case ingredient8 = "strIngredient8"
        case ingredient9 = "strIngredient9"
        case ingredient10 = "strIngredient10"
        case ingredient11 = "strIngredient11"
        case ingredient12 = "strIngredient12"
        case ingredient13 = "strIngredient13"
        case ingredient14 = "strIngredient14"
        case ingredient15 = "strIngredient15"
        case ingredient16 = "strIngredient16"
        case ingredient17 = "strIngredient17"
        case ingredient18 = "strIngredient18"
        case ingredient19 = "strIngredient19"
        case ingredient20 = "strIngredient20"
        case measurement1 = "strMeasure1"
        case measurement2 = "strMeasure2"
        case measurement3 = "strMeasure3"
        case measurement4 = "strMeasure4"
        case measurement5 = "strMeasure5"
        case measurement6 = "strMeasure6"
        case measurement7 = "strMeasure7"
        case measurement8 = "strMeasure8"
        case measurement9 = "strMeasure9"
        case measurement10 = "strMeasure10"
        case measurement11 = "strMeasure11"
        case measurement12 = "strMeasure12"
        case measurement13 = "strMeasure13"
        case measurement14 = "strMeasure14"
        case measurement15 = "strMeasure15"
        case measurement16 = "strMeasure16"
        case measurement17 = "strMeasure17"
        case measurement18 = "strMeasure18"
        case measurement19 = "strMeasure19"
        case measurement20 = "strMeasure20"
    }
    
    public init() {
        
    }
    
    public init(from decoder: Decoder) throws {
        var values = try decoder.container(keyedBy: CodingKeys.self)
        instructions = try values.decode(String.self, forKey: .instructions)
        
        for i in 1...20 {
            if let name: String = values.decode(for: "strIngredient\(i)"),
               let measurement: String = values.decode(for: "strMeasure\(i)"),
               !name.isEmpty, name != " ",
               !measurement.isEmpty, measurement != " " {
                ingredients.append(IngredientModel(name: name, measurement: measurement))
            }
        }
    }
}

public struct IngredientModel {
    public var name: String
    public var measurement: String
}

extension KeyedDecodingContainer {
    mutating func decode<T: Decodable>(for key: String) -> T? {
        // Find the first key that matches the given key.
        // if it exists decode it as usual otherwise return nil
        guard let firstKey = allKeys.first(where: { $0.stringValue == key })
        else { return nil }
        return try? decode(T.self, forKey: firstKey)
    }
}
