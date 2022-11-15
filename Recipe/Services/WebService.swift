//
//  WebService.swift
//  Recipe
//
//  Created by Tibirica Neto on 2022-11-14.
//

import Foundation

enum NetworkError: Error {
    case badRequest
    case decodingError
}

class WebService {
    
    func get<T: Codable>(url: URL, parse: (Data) -> T?) async throws -> T {
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        if (response as? HTTPURLResponse)?.statusCode != 200 {
            throw NetworkError.badRequest
        }
        
        guard let result = parse(data) else {
            throw NetworkError.decodingError
        }
        
        return result
    }
}
