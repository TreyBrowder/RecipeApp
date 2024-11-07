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
                            RecipeImgView(url: recipe.imgSM)
                                .frame(width: 48, height: 48)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(.primary, lineWidth: 2))
                            
                            Text(recipe.name)
                        }
                    }
                }
            }
            .navigationTitle("Recipes")
            .navigationDestination(for: Recipe.self) { recipe in
                VStack(){
                    RecipeImgView(url: recipe.imgLRG)
                        .frame(width: 224, height: 224)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(.primary, lineWidth: 2))
                    
                    
                    HStack(){
                        Text("Orgin:")
                        
                        Text(recipe.cuisine)
                            .bold()
                    }
                    .font(.largeTitle)
                    
                    HStack {
                        if let source = recipe.source,
                           let videoLink = recipe.videoStr {
                            Button("Recipe"){
                                // go to website of the original recipe
                                    //using source
                            }
                            .customSmallBtn()
                            
                            Button("Tutorial"){
                                // go to youtube link
                                    //using videoLink
                            }
                            .customSmallBtn()
                        }
                    }
                    
                }
                .navigationTitle(recipe.name)
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
