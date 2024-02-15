//
//  IndexViewModel.swift
//  TheMealDb
//
//  Created by Mark Schall on 2/14/24.
//

import Foundation
import Combine

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
