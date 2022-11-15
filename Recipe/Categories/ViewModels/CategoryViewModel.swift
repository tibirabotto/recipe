//
//  CategoryViewModel.swift
//  Recipe
//
//  Created by Tibirica Neto on 2022-11-14.
//

import Foundation

@MainActor
class CategoryViewModel: ObservableObject {
    
    @Published var categories: [CategoryModel] = []
    
    func findAll() async {
        do {
            let categoriesResponse = try await WebService().get(url: Constants.Urls.recipeCategoriesURL, parse: { data in
                
                return try? JSONDecoder().decode(Category.self, from: data)
            })
            self.categories = categoriesResponse.categories
            
        } catch let error {
            print("ERROR \(error.localizedDescription)")
        }
    }
}
