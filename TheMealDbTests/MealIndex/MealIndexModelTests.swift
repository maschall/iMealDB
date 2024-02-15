//
//  MealIndexModelTests.swift
//  TheMealDbTests
//
//  Created by Mark Schall on 2/14/24.
//

import XCTest
import TheMealDb

final class MealIndexModelTests: XCTestCase {
    
    let sampleIndexJSON = """
        {
            "strMeal": "Apam balik",
            "strMealThumb": "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
            "idMeal": "53049"
        }
"""
    
    func testIndexParsing() throws {
        let index = sampleIndexJSON.decodeJSON(MealIndex.self)
        
        XCTAssertEqual(index!.id, "53049")
        XCTAssertEqual(index!.name, "Apam balik")
        XCTAssertEqual(index!.thumbnailURL, "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg")
    }
    
    let sampleIndexListJSON = """
{
    "meals": [
        {
            "strMeal": "Apam balik",
            "strMealThumb": "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
            "idMeal": "53049"
        },
        {
            "strMeal": "Apple & Blackberry Crumble",
            "strMealThumb": "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg",
            "idMeal": "52893"
        }
    ]
}
"""
    
    func testListParsing() throws {
        let list = sampleIndexListJSON.decodeJSON(MealIndexList.self)
        
        XCTAssertEqual(list!.meals.count, 2)
    }
    
//    let sampleIndexListJSONWithNulls = """
//{
//    "meals": [
//        {
//            "strMeal": "Apam balik",
//            "strMealThumb": "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg",
//            "idMeal": null
//        },
//        {
//            "strMeal": "Apple & Blackberry Crumble",
//            "strMealThumb": "https://www.themealdb.com/images/media/meals/xvsurr1511719182.jpg",
//            "idMeal": "52893"
//        }
//    ]
//}
//"""
//    
//    func testFailedParsing() throws {
//        let list = sampleIndexListJSONWithNulls.decodeJSON(MealIndexList.self)
//        
//        XCTAssertEqual(list!.meals.count, 1)
//    }

}
