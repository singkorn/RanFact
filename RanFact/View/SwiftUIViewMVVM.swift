//
//  SwiftUIViewMVVM.swift
//  RanFact
//
//  Created by Singkorn Dhepyasuvan on 23/5/2564 BE.
//

import SwiftUI

// Model
struct TestMVVMModel: Decodable {
    var date: String?
    var text: String?
    var number: Int?
    var found: Bool?
    var type: String?
}

// View Model
class SwiftUIViewMVVMViewModel: ObservableObject {
    
    @Published var randomFactItem = TestMVVMModel()
    
    func fetchData() {
        
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
                if let randomFactItem = try jsonDecoder.decode(TestMVVMModel?.self, from: data) {
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

//View
struct SwiftUIViewMVVM: View {
    
    @ObservedObject var viewModel = SwiftUIViewMVVMViewModel()
    
    var body: some View {
        VStack {
                VStack(alignment: .leading) {
                    Text(viewModel.randomFactItem.date ?? "Date Unknown")
                    Text(viewModel.randomFactItem.text ?? "default text")
                    Text(String(viewModel.randomFactItem.number ?? 0))
                    Text(String(viewModel.randomFactItem.found ?? true))
                    Text(viewModel.randomFactItem.type ?? "default type")

                    Print(viewModel.randomFactItem.date ?? "Date Unknown")
                    Print(viewModel.randomFactItem.text ?? "default text")
                    Print(String(viewModel.randomFactItem.number ?? 0))
                    Print(String(viewModel.randomFactItem.found ?? true))
                    Print(viewModel.randomFactItem.type ?? "default type")
                }
            }.onAppear(perform: {
            viewModel.fetchData()
        })
    }
}

struct SwiftUIViewMVVM_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIViewMVVM()
    }
}

extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}
