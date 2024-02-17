//
//  DetailView.swift
//  TheMealDb
//
//  Created by Mark Schall on 2/15/24.
//

import SwiftUI

struct DetailView: View {
    @StateObject var detailViewModel: DetailViewModel
    
    init(indexViewModel: IndexViewModel) {
        _detailViewModel = StateObject(wrappedValue: DetailViewModel(indexViewModel: indexViewModel))
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text(detailViewModel.name).bold()
                AsyncImage(url: detailViewModel.thumbnailURL) { image in image.image?.resizable() }
                    .frame(width: 250, height: 250)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                
                Divider()
                
                Text("\(detailViewModel.ingredients.count) Ingredients").bold()
                ForEach($detailViewModel.ingredients, id: \.name) { $ingredient in
                    Text("\(ingredient.name) -  \(ingredient.measurement)")
                }
                
                Divider()
                
                Text("Instructions").bold()
                Text(detailViewModel.instructions)
            }
            .padding()
        }
    }
    
}

#Preview {
    return DetailView(indexViewModel: IndexViewModel(MealIndex(name: "Apam balik", thumbnailURL: "https://www.themealdb.com/images/media/meals/adxcbq1619787919.jpg", id: "53049")))
}
