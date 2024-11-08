//
//  MockRecipeService.swift
//  RecipeApp
//
//  Created by Trey Browder on 11/7/24.
//

import Foundation

class MockRecipeService: RecipeProtocol {
    var mockData: Data?
    var mockError: APIError?
    
    func fetchRecipes() async throws -> RecipeResponse {
        if let mockError { throw mockError }
        
        do {
            let result = try JSONDecoder().decode(RecipeResponse.self, from: mockData ?? testRecipeData)
            return result
        } catch {
            throw APIError.jsonParseFail(msg: "Mock Parse error")
        }
    }
}
