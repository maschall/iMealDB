//
//  DetailViewModel.swift
//  TheMealDb
//
//  Created by Mark Schall on 2/15/24.
//

import Foundation
import Combine

class DetailViewModel: ObservableObject {
    @Published var name: String
    @Published var thumbnailURL: URL?
    
    @Published var instructions: String = ""
    @Published var ingredients: [IngredientsViewModel] = []
    
    init(indexViewModel: IndexViewModel) {
        self.name = indexViewModel.name
        self.thumbnailURL = indexViewModel.thumbnailURL
        
        let fetchMeal = MealDbAPI.fetchMeal(id: indexViewModel.id)
        
        fetchMeal
            .map { $0.ingredients.map { IngredientsViewModel($0) } }
            .assign(to: &$ingredients)
        
        fetchMeal
            .map(\.instructions)
            .assign(to: &$instructions)
    }
    
}

class IngredientsViewModel: ObservableObject {
    
    @Published var name: String
    @Published var measurement: String
    
    init(_ model: IngredientModel) {
        name = model.name
        measurement = model.measurement
    }
    
}
