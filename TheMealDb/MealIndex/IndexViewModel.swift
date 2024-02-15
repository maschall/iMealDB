//
//  IndexViewModel.swift
//  TheMealDb
//
//  Created by Mark Schall on 2/14/24.
//

import Foundation
import Combine

class IndexListViewModel: ObservableObject {
    @Published var category: String
    
    @Published var meals: [IndexViewModel] = []
    
    init(category: String) {
        self.category = category
        
        let fetchCategory = MealDbAPI.fetchCategory(category: category)
        
        fetchCategory
            .map { $0.meals.map { IndexViewModel($0) } }
            .assign(to: &$meals)
    }
    
}

class IndexViewModel: ObservableObject {
    
    @Published var name: String
    @Published var thumbnailURL: URL?
    @Published var id: String
    
    init(_ model: MealIndex) {
        name = model.name
        thumbnailURL = URL(string: model.thumbnailURL)
        id = model.id
    }
    
}
