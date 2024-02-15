//
//  IndexView.swift
//  TheMealDb
//
//  Created by Mark Schall on 2/14/24.
//

import SwiftUI

struct IndexView: View {
    var list: MealIndexList?
    
    var body: some View {
        VStack{
            Text("The Meal DB")
            if let meals = list?.meals {
                List(meals, id: \.id) { index in
                    IndexCard(meal: index)
                }
            }
        }
    }
}

struct IndexCard: View {
    var meal: MealIndex
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: meal.thumbnailURL)) { image in image.image?.resizable() }
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text(meal.name)
        }
    }
}

#Preview {
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
    
    let list = sampleIndexListJSON.decodeJSON(MealIndexList.self)
    
    return IndexView(list: list)
}
