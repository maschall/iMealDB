//
//  IndexView.swift
//  TheMealDb
//
//  Created by Mark Schall on 2/14/24.
//

import SwiftUI

struct IndexView: View {
    @StateObject private var viewModel : IndexListViewModel
    
    init(category: String) {
        _viewModel = StateObject(wrappedValue: IndexListViewModel(category: category))
    }
    
    var body: some View {
        VStack{
            NavigationSplitView {
                List($viewModel.meals, id: \.id) { $indexViewModel in
                    NavigationLink {
                        DetailView(indexViewModel: indexViewModel)
                    } label: {
                        IndexCard(viewModel: indexViewModel)
                    }
                }
                .navigationTitle(viewModel.category)
            } detail: {
                Text("Select a meal")
            }
        }
    }
}

struct IndexCard: View {
    var viewModel: IndexViewModel
    
    var body: some View {
        HStack {
            AsyncImage(url: viewModel.thumbnailURL) { image in image.image?.resizable() }
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            Text(viewModel.name)
        }
    }
}

#Preview {
    return IndexView(category: "Dessert")
}
