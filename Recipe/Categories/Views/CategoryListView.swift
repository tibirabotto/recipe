//
//  CategoryListView.swift
//  Recipe
//
//  Created by Tibirica Neto on 2022-11-14.
//

import SwiftUI

struct CategoryListView: View {
    
    @StateObject var vm = CategoryViewModel()
    
    var body: some View {
        NavigationStack {
                List( vm.categories, id: \.id) { category in
                    NavigationLink(destination: RecipeListView(categoryName: category.title)) {
                        HStack(spacing: 20) {
                            AsyncImage(url: category.imageUrl) { phase in
                                if let image = phase.image {
                                    image.resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(maxWidth: 100, maxHeight: 100)
                                        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                                } else if phase.error != nil {
                                    Image(systemName: "nosign")
                                } else {
                                    ProgressView()
                                }
                            }
                            Text(category.title)
                        }
                    }
                    .buttonStyle(PlainButtonStyle())
                   
                    
                }
                .listRowInsets(EdgeInsets())
                .listStyle(.plain)
                .navigationTitle("Categories")
                .task {
                    await vm.findAll()
                }
        }
        
    }
}

struct CategoryListView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryListView()
    }
}
