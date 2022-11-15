//
//  Constants.swift
//  Recipe
//
//  Created by Tibirica Neto on 2022-11-14.
//

import Foundation

struct Constants {
    
    struct Urls {
        static let recipeCategoriesURL = URL(string: "https://recipesapi.herokuapp.com/api/v2/categories")!
        
        static func recipeByCategoryName(name: String) -> URL {
            return URL(string: "https://recipesapi.herokuapp.com/api/v2/recipes?q=\(name)&page=1")!
        }
        
        static func recipeById(id: String) -> URL {
            return URL(string: "https://recipesapi.herokuapp.com/api/get?rId=\(id)")!
        }
    }
}
