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
    
    var randomTypes = ["year", "trivia", "random", "math", "date"]
    
    var body: some View {
        
        VStack {
            
            Spacer()
                .frame(height: 200)
            
            VStack(alignment: .center) {
                TextField("Enter text...", text: $name, onEditingChanged: { (changed) in
                    print("Username onEditingChanged - \(changed)")
                }) {
                    print("Username onCommit")
                }
                .keyboardType(.numberPad)
                .onTapGesture {
                    self.endEditing()
                }
                
                Text("You typed: \(name)")
            }
            .inputResult()
            
            VStack(alignment: .leading) {
                Group {
                    Text(viewModel.randomFactItem.date ?? "Date Unknown")
                    Text(viewModel.randomFactItem.text ?? "Text Unknown")
                    Text(String(viewModel.randomFactItem.year ?? 0))
                    Text(String(viewModel.randomFactItem.number ?? 0))
                    Text(String(viewModel.randomFactItem.found ?? false))
                    Text(viewModel.randomFactItem.type ?? "Type Unknown")
                }
                Print(viewModel.randomFactItem.date ?? "Date Unknown")
                Print(viewModel.randomFactItem.text ?? "Text Unknown")
                Print(String(viewModel.randomFactItem.year ?? 0))
                Print(String(viewModel.randomFactItem.number ?? 0))
                Print(String(viewModel.randomFactItem.found ?? false))
                Print(viewModel.randomFactItem.type ?? "Type Unknown")
            }
            .displayResult()
                        
            Spacer()
            
            VStack {
                Button(action: {
                    print("Button Pressed...")
                    print("Typed Text: \(name)")
                    print("Selected Random Type: \(selectedRandomType)")
                    viewModel.fetchData(selectedRandomNumber: name, selectedRandomType: selectedRandomType)
                }) {
                    HStack {
                        Image(systemName: "magnifyingglass.circle.fill")
                        Text("Search")
                            .padding(.horizontal)
                    }
                }
                .padding()
                .foregroundColor(Color.white)
                .background(Color.purple)
                .cornerRadius(8.0)
            }
        }.onAppear(perform: {
            viewModel.fetchData()
        })
        .onTapGesture {
            self.hideKeyboard()
        }
        .padding(.all, 20)
        .frame(minWidth: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealWidth: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, minHeight: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/, idealHeight: 200, maxHeight: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .bottom)
    }
    
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
}

struct TriviaView_Previews: PreviewProvider {
    static var previews: some View {
       TriviaView()
    }
}
