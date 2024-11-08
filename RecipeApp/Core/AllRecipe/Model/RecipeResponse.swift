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
    let imgLRG: String
    let imgSM: String
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

