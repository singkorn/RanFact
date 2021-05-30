//
//  BlueView.swift
//  RanFact
//
//  Created by Singkorn Dhepyasuvan on 16/5/2564 BE.
//

import SwiftUI

struct BlueView: View {
    
    @State private var showShareSheet = false
    @State private var tipAmount = ""

    var body: some View {
        Color.white
            .ignoresSafeArea(.all)
            .overlay(
                VStack {
                    
                    TextField("Name: ", text: $tipAmount)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .keyboardType(.decimalPad)

                    Button("Submit") {
                        print("Tip: \(tipAmount)")
                        hideKeyboard()
                    }

                    Text("Hello, Universe")
                    Button(action: {
                        self.showShareSheet = true
                    }) {
                        Text("Share Me")
                            .bold()
                            .foregroundColor(.blue)
                    }
                })
            .sheet(isPresented: $showShareSheet) {
                ShareSheet(activityItems: ["Hello World"])
            }
    }
}

struct BlueView_Previews: PreviewProvider {
    static var previews: some View {
        BlueView()
    }
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
