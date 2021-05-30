//
//  RandomFactViewModel.swift
//  RanFact
//
//  Created by Singkorn Dhepyasuvan on 16/5/2564 BE.
//

import Foundation

class RandomFactViewModel: ObservableObject {
    
    @Published var randomFactItem = RandomFactModel()
    
    func fetchData() {
        
        let headers = [
            "x-rapidapi-key": "IJAsspsxlKoKWQcL0RinV8IyQxFmSg9M",
            "x-rapidapi-host": "numbersapi.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: API.EndPoint.year.url as URL,
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
