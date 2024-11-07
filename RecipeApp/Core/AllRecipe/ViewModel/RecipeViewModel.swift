//
//  RecipeViewModel.swift
//  RecipeApp
//
//  Created by Trey Browder on 11/7/24.
//

import UIKit

class RecipeViewModel: ObservableObject {
    @Published var recipeArr = [Recipe]()
    @Published var errorMsg: String?
    @Published var isLoading = false
    
    private var service: RecipeProtocol
    
    init(service: RecipeProtocol) {
        self.service = service
    }
    
    @MainActor
    func getRecipes(isRefreshing: Bool) async {
        // If already loading, don't initiate another fetch
        guard !isLoading else { return }
        
        // Set loading state
        isLoading = true
        
        do {
            // Fetch the recipes
            let result = try await service.fetchRecipe()
            
            // If it's a refresh, clear previous error
            if isRefreshing {
                errorMsg = nil
            }
            
            recipeArr = result.recipes
        } catch {
            if let apiError = error as? APIError {
                errorMsg = apiError.description
            }
        }
        
        // Reset loading state
        isLoading = false
    }
    
//MARK: HELPERS
    
    private func isRecipeAvailable(for recipe: Recipe) -> Bool {
        return recipe.source != nil
    }
    
    //Check if tutorial is available
    private func isTutorialAvailable(for recipe: Recipe) -> Bool {
        return recipe.videoStr != nil
    }
    
    ///Dynamic unavailable text for Recipe / Tutorial
    func unavailableText(for recipe: Recipe) -> String? {
        let recipeAvailable = isRecipeAvailable(for: recipe)
        let tutorialAvailable = isTutorialAvailable(for: recipe)
        
        switch (recipeAvailable, tutorialAvailable) {
        case (false, false):
            return "Recipe and tutorial unavailable"
        case (false, true):
            return "Recipe unavailable"
        case (true, false):
            return "Tutorial unavailable"
        default:
            return nil
        }
    }
    
    ///Open URL to website
    func openLink(urlString: String?) {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            return
        }
        UIApplication.shared.open(url)
    }
}
