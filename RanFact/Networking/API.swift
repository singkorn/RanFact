//
//  API.swift
//  RanFact
//
//  Created by Singkorn Dhepyasuvan on 24/5/2564 BE.
//

import Foundation
import Combine
import SwiftUI

struct API {
    
    enum Error: LocalizedError, Identifiable {
        var id: String { localizedDescription }
        case addressUnreachable(URL)
        case invalidResponse
        var errorDescription: String? {
            switch self {
            case .invalidResponse: return "The server responded with garbage."
            case .addressUnreachable(let url): return "\(url.debugDescription)"
            }
        }
    }
    
    enum EndPoint {
        
        static let baseURL = URL(string: "https://numbersapi.p.rapidapi.com/")!
        
        case year
        case trivia
        case random
        case math
        case date
        
        var url: URL {
            switch self {
            case .year:
                return EndPoint.baseURL
                    .appending("json", value: "true")
                    .appending("fragment", value: "true")
            case .trivia:
                return EndPoint.baseURL
                    .appending("json", value: "true")
                    .appending("notfound", value: "floor")
                    .appending("fragment", value: "true")
            case .random:
                return EndPoint.baseURL
                    .appending("json", value: "true")
                    .appending("fragment", value: "true")
                    .appending("max", value: "20")
                    .appending("min", value: "10")
            case .math:
                return EndPoint.baseURL
                    .appending("json", value: "true")
                    .appending("fragment", value: "true")
            case .date:
                return EndPoint.baseURL
                    .appending("json", value: "true")
                    .appending("fragment", value: "true")
            }
        }
    }
    
    static func request(with url: URL) -> URLRequest {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        return request
    }
}

extension URL {
    func appending(_ queryItem: String, value: String?) -> URL {
        guard var urlComponents = URLComponents(string: absoluteString) else { return absoluteURL }
        var queryItems: [URLQueryItem] = urlComponents.queryItems ??  []
        let queryItem = URLQueryItem(name: queryItem, value: value)
        queryItems.append(queryItem)
        urlComponents.queryItems = queryItems
        
        return urlComponents.url!
    }
}
