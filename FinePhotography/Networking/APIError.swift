//
//  APIError.swift
//  FinePhotography
//
//  Created by Adem Burak Cevizli on 6.03.2023.
//

import Foundation

enum APIError: Error {
    case requestFailed
    case invalidData
    case responseUnsuccesful
    case jsonParsingFailed
    case jsonConversionFailed
    
    var localizedDescription: String {
        switch self {
        case .requestFailed:
            return "Request Failed"
        case .invalidData:
            return "Invalid Data"
        case .responseUnsuccesful:
            return "Response Unsuccesful"
        case .jsonParsingFailed:
            return "JSON Parsion Failed"
        case .jsonConversionFailed:
            return "JSON Conversion Failed"
        }
    }
}
