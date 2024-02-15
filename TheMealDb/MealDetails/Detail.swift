//
//  Detail.swift
//  TheMealDb
//
//  Created by Mark Schall on 2/15/24.
//

import Foundation

public struct MealDetailWrapper: Codable {
    public var meals: [MealDetail]
}

public struct MealDetail: Codable {
    public var instructions: String
    public var ingredients: [IngredientModel] = []
    
    private enum CodingKeys: String, CodingKey {
        case instructions = "strInstructions"
    }
}

public struct IngredientModel {
    public var name: String
    public var measurement: String
}
