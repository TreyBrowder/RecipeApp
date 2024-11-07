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

final class RecipeService: RecipeProtocol, Networkable {
    
//MARK: - URL Related variables/functions
    private var recipeUrl: String? {
        var components = URLComponents()
        
        components.scheme = "https"
        components.host = "d3jbb8n5wk0qxi.cloudfront.net"
        components.path = "/recipes.json"
        
        return components.url?.absoluteString
    }
    
//MARK: - Fetch Data Methods
    
    ///Asychronous function to retreive dessert data from API
    func fetchRecipe() async throws -> RecipeResponse {
        guard let endpoint = recipeUrl else {
            throw APIError.requestFailed(msg: "Invalid URL")
        }
        
        return try await fetchData(as: RecipeResponse.self, endpoint: endpoint)
    }
    
    ///Asychronous function to retreive dessert details data from API
//    func fetchDessertDetails(id: String) async throws -> DessertDetails {
//        if let cached = DessertDetailsCache.shared.get(key: id) {
//            return cached
//        }
//        
//        guard let endpoint = dessertDetailsUrlString(id: id) else {
//            throw DessertAPIError.requestFailed(description: "Invalid URL")
//        }
//        
//        let details = try await fetchData(as: DessertDetails.self, endpoint: endpoint)
//        DessertDetailsCache.shared.set(dessertDetails: details, key: id)
//        return details
//    }
}
