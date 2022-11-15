//
//  Recipe.swift
//  Recipe
//
//  Created by Tibirica Neto on 2022-11-14.
//

import Foundation

struct Recipe: Codable {
    let recipes: [RecipeDetail]
    
}

struct RecipeIngredient: Codable {
    let recipe: Ingredient
}


struct RecipeDetail: Codable {
    let id: String
    let title: String
    let imageUrl: URL
}

struct Ingredient: Codable {
    let ingredients: [String]
}
