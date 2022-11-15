//
//  CategoryService.swift
//  Recipe
//
//  Created by Tibirica Neto on 2022-11-14.
//

import Foundation

class CategoryService {
    
    func fetch() -> Data {
        URLSession.shared.dataTask(with: Constants.Urls.recipeCategoriesURL) { [weak self] data, response, error in
            
        }.resume()
    }
}
