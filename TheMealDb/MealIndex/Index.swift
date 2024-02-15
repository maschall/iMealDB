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

