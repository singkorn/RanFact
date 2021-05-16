//
//  BlueView.swift
//  RanFact
//
//  Created by Singkorn Dhepyasuvan on 16/5/2564 BE.
//

import SwiftUI

struct BlueView: View {
    var body: some View {
        Color.blue
            .ignoresSafeArea(.all)
            .overlay(
                VStack {
                    Text("Hello, Universe")
                })
    }
}

struct BlueView_Previews: PreviewProvider {
    static var previews: some View {
        BlueView()
    }
}
