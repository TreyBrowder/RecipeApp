//
//  RecipeDetails.swift
//  RecipeApp
//
//  Created by Trey Browder on 11/7/24.
//

import SwiftUI

struct RecipeDetails: View {
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
            
            HStack {
                if let source = recipe.source,
                   let url = URL(string: source){
                    Button("Recipe") {
                        UIApplication.shared.open(url)
                    }
                    .customSmallBtn()
                }
                
                if let videoLink = recipe.videoStr,
                   let url = URL(string: videoLink){
                    Button("Tutorial") {
                        UIApplication.shared.open(url)
                    }
                    .customSmallBtn()
                }
            }
        }
    }
}


#Preview {
    RecipeDetails(recipe: Recipe(id: "599344f4-3c5c-4cca-b914-2210e3b3312f",
                                 cuisine: "British",
                                 name: "Apple & Blackberry Crumble",
                                 imgLRG: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/large.jpg",
                                 imgSM: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/small.jpg",
                                 source: "https://www.bbcgoodfood.com/recipes/778642/apple-and-blackberry-crumble",
                                 videoStr: "https://www.youtube.com/watch?v=4vhcOwVBDO4"))
}

/*
 {
 "cuisine": "British",
 "name": "Apple & Blackberry Crumble",
 "photo_url_large": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/large.jpg",
 "photo_url_small": "https://d3jbb8n5wk0qxi.cloudfront.net/photos/535dfe4e-5d61-4db6-ba8f-7a27b1214f5d/small.jpg",
 "source_url": "https://www.bbcgoodfood.com/recipes/778642/apple-and-blackberry-crumble",
 "uuid": "599344f4-3c5c-4cca-b914-2210e3b3312f",
 "youtube_url": "https://www.youtube.com/watch?v=4vhcOwVBDO4"
 }
 */
