//
//  RecipeViewModel.swift
//  RecipeApp
//
//  Created by Trey Browder on 11/7/24.
//

import Foundation

class RecipeViewModel: ObservableObject {
    @Published var recipeArr = [Recipe]()
    @Published var errorMsg: String?
    
    private var service: RecipeProtocol
    
    init(service: RecipeProtocol) {
        self.service = service
    }
    
    @MainActor
    func getRecipes() async {
        do {
            let result = try await service.fetchRecipe()
            recipeArr = result.recipes
        } catch {
            guard let error = error as? APIError else { return }
            print(error.description)
            self.errorMsg = error.description
        }
    }
}
