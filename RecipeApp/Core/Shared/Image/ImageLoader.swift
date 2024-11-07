//
//  ImageLoader.swift
//  RecipeApp
//
//  Created by Trey Browder on 11/7/24.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    @Published var image: Image?
    
    private let urlString: String
    
    init(urlString: String) {
        self.urlString = urlString
        
        Task { try await loadImage() }
    }
    
    @MainActor
    private func loadImage() async throws {
        
        if let cached = ImageCache.shared.get(key: urlString) {
            self.image = Image(uiImage: cached)
            return
        }
        
        guard let url = URL(string: urlString) else { return }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        do {
            guard let httpResponse = response as? HTTPURLResponse else {
                throw APIError.requestFailed(msg: "Request Failed")
            }
            
            guard httpResponse.statusCode == 200 else {
                throw APIError.invalidStatusCode(code: httpResponse.statusCode)
            }
            
            guard let uiImage = UIImage(data: data) else { return }
            ImageCache.shared.set(image: uiImage, key: urlString)
            self.image = Image(uiImage: uiImage)
        } catch {
            print("DEBUG - ERROR: Failed to fetch image with error \(error)")
        }
    }
}
