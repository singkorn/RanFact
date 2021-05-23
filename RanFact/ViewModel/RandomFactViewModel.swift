//
//  RandomFactViewModel.swift
//  RanFact
//
//  Created by Singkorn Dhepyasuvan on 16/5/2564 BE.
//

import Foundation

class RandomFactViewModel {
    
    func getJSON(completion: @escaping (RandomYearFact) -> ()) {
        
        let headers = [
            "x-rapidapi-key": "IJAsspsxlKoKWQcL0RinV8IyQxFmSg9M",
            "x-rapidapi-host": "numbersapi.p.rapidapi.com"
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://numbersapi.p.rapidapi.com/1492/year?json=true&fragment=true")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
            }
            
            guard let data = data else {
                print("URLSession dataTask error:", error ?? "nil")
                return
            }
            
            do {
                let jsonDecoder = JSONDecoder()
                if let randomFact = try jsonDecoder.decode(RandomYearFact?.self, from: data) {
                    DispatchQueue.main.async {
                        
                        completion(randomFact)
                        
                        print("\n\n")
                        print("Date: \(randomFact.date)")
                        print("Text: \(randomFact.text)")
                        print("Number: \(randomFact.number)")
                        print("Found: \(randomFact.found)")
                        print("Type: \(randomFact.type)")
                    }
                }
            } catch {
                print("JSONSerialization error:", error)
            }
            
        })
        
        dataTask.resume()
    }
}
