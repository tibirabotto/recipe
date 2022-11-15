//
//  RecipeView.swift
//  Recipe
//
//  Created by Tibirica Neto on 2022-11-14.
//

import SwiftUI

struct RecipeListView: View {
    
    @StateObject var vm = RecipeViewModel()
    let categoryName: String
    
    init(categoryName: String) {
        self.categoryName = categoryName
    }
    
    var body: some View {
            List( vm.recipes, id: \.id) { recipe in
                NavigationLink(destination: RecipeDetailView(id: recipe.id, title: recipe.title)) {
                    HStack(spacing: 20) {
                        AsyncImage(url: recipe.imageUrl) { phase in
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
                        Text(recipe.title)
                    }
                }
                .buttonStyle(PlainButtonStyle())
               
                
            }
            .listRowInsets(EdgeInsets())
            .listStyle(.plain)
            .task {
                vm.categoryName = categoryName
                await vm.findRecipeByCategory()
            }
            .navigationTitle("Recipes")
    }
}

struct RecipeView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView(categoryName: "Indian")
    }
}
