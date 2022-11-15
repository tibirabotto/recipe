//
//  Category.swift
//  Recipe
//
//  Created by Tibirica Neto on 2022-11-14.
//

import Foundation

struct Category: Codable {
    let categories: [CategoryModel]
}

struct CategoryModel: Codable {
    var id: UUID { return UUID() }
    let imageUrl: URL
    let title: String
}
