//
//  OrangeView.swift
//  RanFact
//
//  Created by Singkorn Dhepyasuvan on 16/5/2564 BE.
//

import SwiftUI

struct OrangeView: View {
    
    @ObservedObject var viewModel = RandomFactViewModel()
    @State private var name: String = "Tim"
    @State private var selectorIndex = 0
    @State private var numbers = ["1", "2", "3"]
    
    var body: some View {
        
        VStack {
            VStack(alignment: .leading) {
                TextField("Enter your name", text: $name)
                Text("Hello, \(name)!")
            }
            Picker("Numbers", selection: $selectorIndex) {
                ForEach(0..<numbers.count) { index in
                    Text(self.numbers[index]).tag(index)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .padding()
            Label("Your account", systemImage: "person.crop.circle")
            Label("Welcome to the app", image: "star")                .labelStyle(TitleOnlyLabelStyle())
            VStack {
                Label("Text Only", systemImage: "heart")
                    .font(.title)
                    .labelStyle(TitleOnlyLabelStyle())
                
                Label("Icon Only", systemImage: "star")
                    .font(.title)
                    .labelStyle(IconOnlyLabelStyle())
                
                Label("Both", systemImage: "paperplane")
                    .font(.title)
            }
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

struct OrangeView_Previews: PreviewProvider {
    static var previews: some View {
        OrangeView()
    }
}
