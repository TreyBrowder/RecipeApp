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
                ForEach(recipeVM.filteredMeals) { recipe in // currently hold 63 items 
                    NavigationLink(value: recipe) {
                        HStack {
                            RecipeImgView(url: recipe.imgSM)
                                .frame(width: 48, height: 48)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(.primary, lineWidth: 2))
                            
                            Text(recipe.name)
                        }
                    }
                }
            }
            .listStyle(.plain)
            .searchable(text: $recipeVM.searchedText)
            .navigationTitle("Recipes")
            .hideBackButtonTitle()
            .navigationDestination(for: Recipe.self) { recipe in
                RecipeDetails(recipeVM: recipeVM, recipe: recipe)
                    .navigationTitle(recipe.name)
                    .navigationBarTitleDisplayMode(.inline)
            }
            .refreshable {
                //This is where any update to the data would happen by fetching more recipes
                await recipeVM.getRecipes(isRefreshing: true)
                
            }
        }
        .task {
            await recipeVM.getRecipes(isRefreshing: false)
        }
        .overlay {
            if let error = recipeVM.errorMsg {
                if #available(iOS 17.0, *) {
                    ErrorView(errorStr: error)
                        .containerRelativeFrame([.horizontal, .vertical])
                        .background(Color(.darkGray))
                } else {
                    // Fallback on earlier versions
                    GeometryReader { geometry in
                        ErrorView(errorStr: error)
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .background(Color(.darkGray))
                    }
                    .ignoresSafeArea(.all)
                }
            }
        }
    }
}

#Preview {
    AllRecipeView(service: RecipeService())
}
