//
//  OrangeView.swift
//  RanFact
//
//  Created by Singkorn Dhepyasuvan on 16/5/2564 BE.
//

import SwiftUI

struct OrangeView: View {
    
    @ObservedObject var viewModel = RandomFactViewModel()
    @State private var name: String = ""
    @State private var selectorIndex = 0
    @State private var selectedRandomType = "year"
    var randomTypes = ["year", "trivia", "random", "math", "date"]
    
    var body: some View {
        
        VStack {
            
            VStack(alignment: .center) {
                TextField("Enter text...", text: $name, onEditingChanged: { (changed) in
                    print("Username onEditingChanged - \(changed)")
                }) {
                    print("Username onCommit")
                }.onTapGesture {
                    self.endEditing()
                }
                
                Text("You typed: \(name)")
            }.padding()

            VStack {
                Picker("Random Types", selection: $selectedRandomType) {
                    ForEach(randomTypes, id: \.self) {
                        Text($0)
                    }
                }
                Text("Selected Random Type: \(selectedRandomType)")
            }
            .pickerStyle(WheelPickerStyle())
            .padding()
            
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
            
            VStack {
                Button("OK") {
                    print("Button Pressed...")
                    print("Typed Text: \(name)")
                    print("Selected Random Type: \(selectedRandomType)")
                    viewModel.fetchData(selectedRandomNumber: name, selectedRandomType: selectedRandomType)
                }.padding()
            }
        }.onAppear(perform: {
            viewModel.fetchData()
        })
    }
    
    private func endEditing() {
        UIApplication.shared.endEditing()
    }
}

struct OrangeView_Previews: PreviewProvider {
    static var previews: some View {
        OrangeView()
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

extension View {
    func Print(_ vars: Any...) -> some View {
        for v in vars { print(v) }
        return EmptyView()
    }
}
