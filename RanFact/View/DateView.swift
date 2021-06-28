//
//  DateView.swift
//  RanFact
//
//  Created by Singkorn Dhepyasuvan on 27/6/2564 BE.
//

import SwiftUI

struct DateView: View {
    
    @ObservedObject var viewModel = RandomFactViewModel()
    @State private var name: String = ""
    @State private var selectorIndex = 0
    @State private var selectedRandomType = "date"
    
    var randomTypes = ["year", "trivia", "random", "math", "date"]
    
    var body: some View {
        
        VStack {
            
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
            .padding()
            .foregroundColor(Color.white)
            .background(Color.green)
            .cornerRadius(8.0)
            

//            VStack {
//                Picker("Random Types", selection: $selectedRandomType) {
//                    ForEach(randomTypes, id: \.self) {
//                        Text($0)
//                    }
//                }
//                Text("Selected Random Type: \(selectedRandomType)")
//            }
//            .pickerStyle(WheelPickerStyle())
//            .padding()
//            .foregroundColor(Color.white)
//            .background(Color.orange)
//            .cornerRadius(8.0)
            
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
            .padding()
            .foregroundColor(Color.white)
            .background(Color.blue)
            .cornerRadius(8.0)
            
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
    }
    
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        DateView()
    }
}

