//
//  BlueView.swift
//  RanFact
//
//  Created by Singkorn Dhepyasuvan on 16/5/2564 BE.
//

import SwiftUI

struct BlueView: View {
    
    @State private var showShareSheet = false

    var body: some View {
        Color.white
            .ignoresSafeArea(.all)
            .overlay(
                VStack {
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
