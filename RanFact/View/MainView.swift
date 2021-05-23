//
//  MainView.swift
//  RanFact
//
//  Created by Singkorn Dhepyasuvan on 11/5/2564 BE.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            OrangeView(randomyearfact: RandomYearFact.init(date: "", text: "", number: 0, found: false, type: ""))
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }

            BlueView()
                .tabItem {
                    Label("Random Number", systemImage: "shuffle")
                }
            SwiftUIViewMVVM()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
        .font(.headline)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
