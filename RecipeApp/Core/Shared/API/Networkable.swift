//
//  HTTPClient.swift
//  RecipeApp
//
//  Created by Trey Browder on 11/7/24.
//

import Foundation

protocol Networkable {
    func fetchData<T: Decodable>(as type: T.Type, endpoint: String) async throws -> T
}

//provides a default implementation to the fetchData function in the DataDownloaderProtocol
extension Networkable {
    func fetchData<T: Decodable>(as type: T.Type, endpoint: String) async throws -> T {

        guard let url = URL(string: endpoint) else {
            throw APIError.requestFailed(msg: "Invalid URL")
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.requestFailed(msg: "Request Failed")
        }
        
        guard httpResponse.statusCode == 200 else {
            throw APIError.invalidStatusCode(code: httpResponse.statusCode)
        }
        
        do {
           return try JSONDecoder().decode(type, from: data)
            

        } catch {
            print("DEBUG - Service ERROR: \(error)")
            throw error as? APIError ?? .unknownError(error: error)
        }
    }
}
