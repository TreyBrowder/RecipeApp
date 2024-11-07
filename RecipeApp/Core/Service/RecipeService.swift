//
//  RecipeService.swift
//  RecipeApp
//
//  Created by Trey Browder on 11/7/24.
//

import Foundation

protocol RecipeProtocol {
    func fetchRecipe() async throws -> RecipeResponse
}

class RecipeService: RecipeProtocol, Networkable {
    
//MARK: - URL Related variables
    private var recipeUrl: String? {
        var components = URLComponents()
        
        components.scheme = "https"
        components.host = "d3jbb8n5wk0qxi.cloudfront.net"
        components.path = "/recipes.json"
        
        return components.url?.absoluteString
    }
    
//MARK: - Fetch Data Method
    ///Asychronous function to retreive dessert data from API
    func fetchRecipe() async throws -> RecipeResponse {
        guard let endpoint = recipeUrl else {
            throw APIError.requestFailed(msg: "Invalid URL")
        }
        
        return try await fetchData(as: RecipeResponse.self, endpoint: endpoint)
    }
}
