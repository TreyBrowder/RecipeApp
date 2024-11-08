//
//  APIError.swift
//  RecipeApp
//
//  Created by Trey Browder on 11/7/24.
//

import Foundation

enum APIError: Error {
    case invalidData
    case jsonParseFail(msg: String)
    case requestFailed(msg: String)
    case invalidStatusCode(code: Int)
    case EmptyData(msg: String)
    case unknownError(error: Error)
    
    var description: String {
        switch self {
        case .invalidData:
            return "DEBUG - ERROR: Invalid data was returned"
        case let .jsonParseFail(msg):
            return "DEBUG - ERROR: Failed to parse the data: \(msg)"
        case let .requestFailed(msg):
            return "DEBUG - ERROR: Request FAILED: \(msg)"
        case let .invalidStatusCode(code):
            return "DEBUG - ERROR: Invalid status code: \(code)"
        case let .EmptyData(msg):
            return "DEBUG - ERROR: Empty Data \(msg)"
        case let .unknownError(error):
            return "DEBUG - ERROR: Unknown error occurred: \(error.localizedDescription)"
        }
    }
}
