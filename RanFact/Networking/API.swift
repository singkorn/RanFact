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
                let finalURL = EndPoint.baseURL
                    .appending("json", value: "true")
                    .appending("fragment", value: "true")
                return finalURL.appendingPathComponent("1492/year")
//                return EndPoint.baseURL.appendingPathComponent("1492/year?json=true&fragment=true")
            case .trivia:
                return EndPoint.baseURL.appendingPathComponent("42/trivia?json=true&notfound=floor&fragment=true")
            case .random:
                return EndPoint.baseURL.appendingPathComponent("random/trivia?json=true&fragment=true&max=20&min=10")
            case .math:
                return EndPoint.baseURL.appendingPathComponent("1729/math?json=true&fragment=true")
            case .date:
                return EndPoint.baseURL.appendingPathComponent("6/21/date?json=true&fragment=true")
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
