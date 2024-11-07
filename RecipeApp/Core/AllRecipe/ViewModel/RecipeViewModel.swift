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
