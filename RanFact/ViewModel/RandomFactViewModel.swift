//
//  RandomFactViewModel.swift
//  RanFact
//
//  Created by Singkorn Dhepyasuvan on 16/5/2564 BE.
//

import Foundation

class RandomFactViewModel: ObservableObject {
    
    @Published var randomFactItem = RandomFactModel()
    
    func fetchData(selectedRandomNumber: String = "1492", selectedRandomType: String = "year") {
        
        let headers = [
            "x-rapidapi-key": "IJAsspsxlKoKWQcL0RinV8IyQxFmSg9M",
            "x-rapidapi-host": "numbersapi.p.rapidapi.com"
        ]
                
        var finalURL: URL {
            switch selectedRandomType {
            case "year":
                return API.EndPoint.year.url.appendingPathComponent("\(selectedRandomNumber)/\(selectedRandomType)")
            case "trivia":
                return API.EndPoint.trivia.url.appendingPathComponent("\(selectedRandomNumber)/\(selectedRandomType)")
            case "random":
                return API.EndPoint.random.url.appendingPathComponent("\(selectedRandomType)/trivia")
            case "math":
                return API.EndPoint.math.url.appendingPathComponent("\(selectedRandomNumber)/\(selectedRandomType)")
            case "date":
                return API.EndPoint.date.url.appendingPathComponent("\(selectedRandomNumber)/\(selectedRandomType)")
            default:
                return API.EndPoint.random.url.appendingPathComponent("\(selectedRandomType)/trivia")
            }
        }
        
        print("Final URL: \(finalURL)")
        
        let request = NSMutableURLRequest(url: finalURL as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard let data = data else {
                print("URLSession dataTask error:", error ?? "nil")
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                if let randomFactItem = try jsonDecoder.decode(RandomFactModel?.self, from: data) {
                    DispatchQueue.main.async {
                        self.randomFactItem = randomFactItem
                    }
                }
            } catch {
                print("JSONSerialization error:", error)
            }
        }).resume()
    }
}
