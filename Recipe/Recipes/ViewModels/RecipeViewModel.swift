//
//  RecipeViewModel.swift
//  Recipe
//
//  Created by Tibirica Neto on 2022-11-14.
//

import Foundation

@MainActor
class RecipeViewModel: ObservableObject {
    
    @Published var recipes: [RecipeDetail] = []
    @Published var ingredients: [String] = []
    @Published var categoryName: String?
    @Published var recipeId: String?
  
    
    func findRecipeByCategory() async {
        do {
            guard let categoryName = categoryName else {return}
            let categoriesResponse = try await WebService().get(url: Constants.Urls.recipeByCategoryName(name: categoryName), parse: { data in
                
                return try? JSONDecoder().decode(Recipe.self, from: data)
            })
            self.recipes = categoriesResponse.recipes
            
        } catch let error {
            print("ERROR \(error.localizedDescription)")
        }
    }
    
    func findRecipeById() async {
        do {
            guard let recipeId = recipeId else {return}
            let categoriesResponse = try await WebService().get(url: Constants.Urls.recipeById(id: recipeId), parse: { data in
                return try? JSONDecoder().decode(RecipeIngredient.self, from: data)
            })
            self.ingredients = categoriesResponse.recipe.ingredients
        } catch let error {
            print("ERROR \(error.localizedDescription)")
        }
    }
}
