//
//  RecipeDetails.swift
//  RecipeApp
//
//  Created by Trey Browder on 11/7/24.
//

import SwiftUI

struct RecipeDetails: View {
    @ObservedObject var recipeVM: RecipeViewModel
    var recipe: Recipe
    
    var body: some View {
        VStack(){
            RecipeImgView(url: recipe.imgLRG)
                .frame(width: 224, height: 224)
                .clipShape(Circle())
                .overlay(Circle().stroke(.primary, lineWidth: 2))
            
            VStack(alignment: .leading, spacing: 6){
                HStack(){
                    Text("Name:")
                    Text(recipe.name)
                        .bold()
                }
                
                HStack(){
                    Text("Orgin:")
                    Text(recipe.cuisine)
                        .bold()
                }
            }
            .font(.system(size: 24))
            
            //text if Recipe/Tutorial unavailable
            if let unavailableText = recipeVM.unavailableText(for: recipe) {
                Text(unavailableText)
                    .font(.system(size: 22))
                    .fontWeight(.semibold)
                    .foregroundColor(.red)
            }
            
            HStack {
                if let source = recipe.source {
                    Button("Recipe") {
                        recipeVM.openLink(urlString: source)
                    }
                    .customSmallBtn()
                }
                
                if let videoLink = recipe.videoStr {
                    Button("Tutorial") {
                        recipeVM.openLink(urlString: videoLink)
                    }
                    .customSmallBtn()
                }
            }
        }
    }
}


#Preview {
    RecipeDetails(recipeVM: RecipeViewModel(service: RecipeService()),
                  recipe: Recipe(id: "599344f4-3c5c-4cca-b914-2210e3b3312f",
                                 cuisine: "British",
                                 name: "Apple & Blackberry Crumble",
                                 imgLRG: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/large.jpg",
                                 imgSM: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/small.jpg",
                                 source: "https://www.bbcgoodfood.com/recipes/778642/apple-and-blackberry-crumble",
                                 videoStr: "https://www.youtube.com/watch?v=4vhcOwVBDO4"))
}
