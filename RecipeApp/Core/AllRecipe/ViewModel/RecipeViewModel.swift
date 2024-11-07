//
//  RecipeViewModel.swift
//  RecipeApp
//
//  Created by Trey Browder on 11/7/24.
//

import Foundation
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
    
    func isRecipeAvailable(for recipe: Recipe) -> Bool {
        return recipe.source != nil
    }
    
    //Check if tutorial is available
    func isTutorialAvailable(for recipe: Recipe) -> Bool {
        return recipe.videoStr != nil
    }
    
    ///Dynamic unavailable text for Recipe / Tutorial
    func unavailableText(for recipe: Recipe) -> String? {
        if !isRecipeAvailable(for: recipe) && !isTutorialAvailable(for: recipe) {
            return "Recipe and tutorial unavailable"
        } else if !isRecipeAvailable(for: recipe) {
            return "Recipe unavailable"
        } else if !isTutorialAvailable(for: recipe) {
            return "Tutorial unavailable"
        }
        return nil
    }
    
    ///Open URL
    func openLink(urlString: String?) {
        guard let urlString = urlString, let url = URL(string: urlString) else {
            return
        }
        UIApplication.shared.open(url)
    }
}
