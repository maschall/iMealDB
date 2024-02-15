//
//  DetailView.swift
//  TheMealDb
//
//  Created by Mark Schall on 2/15/24.
//

import SwiftUI

struct DetailView: View {
    @StateObject var indexViewModel: IndexViewModel
    
    var body: some View {
        Text("Test")
    }
    
}

#Preview {
    return DetailView(indexViewModel: IndexViewModel(MealIndex(name: "Apam balik", thumbnailURL: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", id: "53049")))
}
