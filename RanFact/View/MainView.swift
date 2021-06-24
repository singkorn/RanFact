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
            OrangeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            BlueView()
                .tabItem {
                    Label("Random Number", systemImage: "shuffle")
                }
            AnimateCardsView()
                .tabItem {
                    Label("Cards", systemImage: "greetingcard.fill")
                }
            YearView()
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
