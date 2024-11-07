//
//  APIError.swift
//  RecipeApp
//
//  Created by Trey Browder on 11/7/24.
//

import Foundation

enum APIError: Error {
    case invalidData
    case jsonParseFail
    case requestFailed(msg: String)
    case invalidStatusCode(code: Int)
    case unknownError(error: Error)
    
    var description: String {
        switch self {
        case .invalidData:
            return "DEBUG - ERROR: Invalid data was returned"
        case .jsonParseFail:
            return "DEBUG - ERROR: Failed to parse the data"
        case let .requestFailed(msg):
            return "DEBUG - ERROR: Request FAILED: \(msg)"
        case let .invalidStatusCode(code):
            return "DEBUG - ERROR: Invalid status code: \(code)"
        case let .unknownError(error):
            return "DEBUG - ERROR: Unknown error occurred: \(error.localizedDescription)"
        }
    }
}
