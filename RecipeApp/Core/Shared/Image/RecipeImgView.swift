//
//  RecipeImgView.swift
//  RecipeApp
//
//  Created by Trey Browder on 11/7/24.
//

import SwiftUI

struct RecipeImgView: View {
    @ObservedObject var imageLoader: ImageLoader
    
    init(url: String) {
        imageLoader = ImageLoader(urlString: url)
    }
    
    var body: some View {
        if let image = imageLoader.image {
            image
                .resizable()
        }
    }
}
#Preview {
    RecipeImgView(url: "https://d3jbb8n5wk0qxi.cloudfront.net/photos/8f60cd87-20ab-419b-a425-56b7ad7c8566/small.jpg")
}
