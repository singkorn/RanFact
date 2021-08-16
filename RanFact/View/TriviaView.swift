//
//  TriviaView.swift
//  RanFact
//
//  Created by Singkorn Dhepyasuvan on 27/6/2564 BE.
//

import SwiftUI

struct TriviaView: View {
    
    @ObservedObject var viewModel = RandomFactViewModel()
    @State private var name: String = ""
    @State private var selectorIndex = 0
    @State private var selectedRandomType = "trivia"
    @State private var triviaNum = ""
    
    var randomTypes = ["year", "trivia", "random", "math", "date"]
    
    var body: some View {
        
        VStack {
            
            VStack(alignment: .center) {
                TextField("What's the number?", text: $triviaNum)
                    .padding()
                    .keyboardType(.numberPad)
                    .multilineTextAlignment(.center)
            }
            .inputResult()
            
            VStack(alignment: .leading) {
                Group {
                    Text(viewModel.randomFactItem.text ?? "Text Unknown")
                }
                
                Button(action: shareButton, label: {
                    Text("Share")
                    Image(systemName: "square.and.arrow.up")
                })
                
                Print(viewModel.randomFactItem.date ?? "Date Unknown")
                Print(viewModel.randomFactItem.text ?? "Text Unknown")
                Print(String(viewModel.randomFactItem.year ?? 0))
                Print(String(viewModel.randomFactItem.number ?? 0))
                Print(String(viewModel.randomFactItem.found ?? false))
                Print(viewModel.randomFactItem.type ?? "Type Unknown")
            }
            .displayResult()
                        
            Spacer()
                .frame(height: 20)
            
            VStack {
                Button(action: {
                    print("Button Pressed...")
                    print("Typed Text: \(triviaNum)")
                    print("Selected Random Type: \(selectedRandomType)")
                    viewModel.fetchData(selectedRandomNumber: triviaNum, selectedRandomType: selectedRandomType)
                }) {
                    HStack {
                        Image(systemName: "magnifyingglass.circle.fill")
                        Text("Search")
                            .padding(.horizontal)
                    }
                }
                .padding()
                .foregroundColor(Color.white)
                .background(Color("woollyColor3"))
                .cornerRadius(8.0)
            }
        }.onAppear(perform: {
            viewModel.fetchData()
        })
        .onTapGesture {
            self.hideKeyboard()
        }
        .padding(.all, 20)
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 200, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .center)
//        .background(Image("woollyImage4")).ignoresSafeArea(.all)
    }
    
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
    
    func shareButton() {
        let sharedText: String = viewModel.randomFactItem.text ?? "Randomized by ChocBox"
        let activityController = UIActivityViewController(activityItems: [sharedText + " #ChocBox"], applicationActivities: nil)
        
        UIApplication.shared.windows.first?.rootViewController!.present(activityController, animated: true, completion: nil)
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
       TriviaView()
    }
}
