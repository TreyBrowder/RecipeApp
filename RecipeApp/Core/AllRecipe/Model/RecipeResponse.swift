//
//  RecipeResponse.swift
//  RecipeApp
//
//  Created by Trey Browder on 11/7/24.
//

import Foundation

struct RecipeResponse: Decodable {
    let recipes: [Recipe]
}

struct Recipe: Identifiable, Decodable, Hashable {
    let id: String
    let cuisine: String
    let name: String
    let imgLRG: String?
    let imgSM: String?
    let source: String?
    let videoStr: String?
    
    enum CodingKeys: String, CodingKey {
        case cuisine, name
        case id = "uuid"
        case imgLRG = "photo_url_large"
        case imgSM = "photo_url_small"
        case source = "source_url"
        case videoStr = "youtube_url"
    }
}

/*
 Sample response
 {
 "recipes": [63 items]
 }
 
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

