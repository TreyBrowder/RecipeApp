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
    @Published var searchedText = ""
    
    private var service: RecipeProtocol
    
    ///Filtering searched text functionality
    var filteredMeals: [Recipe] {
        guard !searchedText.isEmpty else { return recipeArr }
        return recipeArr.filter { recipe in
            recipe.name.lowercased().contains(searchedText.lowercased())
        }
    }
    
    init(service: RecipeProtocol) {
        self.service = service
    }
    
    @MainActor
    func getRecipes(isRefreshing: Bool) async {
        
        guard !isLoading else { return }
        
        isLoading = true
        
        do {
            let result = try await service.fetchRecipes()
            
            if isRefreshing {
                errorMsg = nil
            }
            
            if !result.recipes.isEmpty {
                recipeArr = result.recipes
            } else {
                throw APIError.EmptyData(msg: "No Recipes Available at this time")
            }
        } catch {
            if let apiError = error as? APIError {
                errorMsg = apiError.description
            }
        }
        
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
