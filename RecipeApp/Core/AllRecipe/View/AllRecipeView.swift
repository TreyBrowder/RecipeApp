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
            .hideBackButtonTitle()
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
                        if let source = recipe.source {
                                Button("Recipe") {
                                    // Go to website of the original recipe using source
                                }
                                .customSmallBtn()
                            }
                            
                            if let videoLink = recipe.videoStr {
                                Button("Tutorial") {
                                    // Go to YouTube link using videoLink
                                }
                                .customSmallBtn()
                            }
                    }
                    
                }
                .navigationTitle(recipe.name)
                .navigationBarTitleDisplayMode(.inline)
            }
            .overlay {
                if let error = recipeVM.errorMsg {
                    if #available(iOS 17.0, *) {
                        VStack(alignment: .center, spacing: 6) {
                            Image(systemName: "exclamationmark.octagon")
                            
                            Text(error)
                                .font(.system(size: 26))
                                .fontWeight(.semibold)
                        }
                        .containerRelativeFrame([.horizontal, .vertical])
                        .background(Color(.darkGray))
                    } else {
                        // Fallback on earlier versions
                        GeometryReader { geometry in
                            VStack(alignment: .center, spacing: 6) {
                                Image(systemName: "exclamationmark.octagon")
                                
                                Text(error)
                                    .font(.system(size: 26))
                                    .fontWeight(.semibold)
                            }
                            .frame(width: geometry.size.width, height: geometry.size.height)
                            .background(Color(.darkGray))
                        }
                        .ignoresSafeArea(.all)
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
