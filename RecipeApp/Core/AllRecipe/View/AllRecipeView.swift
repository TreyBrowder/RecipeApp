//
//  ContentView.swift
//  RecipeApp
//
//  Created by Trey Browder on 11/7/24.
//

import SwiftUI

struct AllRecipeView: View {
    @StateObject var recipeVM: RecipeViewModel
    
    init(service: RecipeProtocol){
        _recipeVM = StateObject(wrappedValue: RecipeViewModel(service: service))
    }
    
    var body: some View {
        NavigationStack() {
            List {
                ForEach(recipeVM.recipeArr) { recipe in
                    NavigationLink(value: recipe) {
                        HStack {
                            Text(recipe.name)
                        }
                    }
                }
            }
        }
        .task {
            await recipeVM.getRecipes()
        }
    }
}

#Preview {
    AllRecipeView(service: RecipeService())
}
