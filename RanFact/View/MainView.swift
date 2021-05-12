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
            RedView()
                .tabItem {
                    Label("Menu", systemImage: "hare.fill")
                }

            BlueView()
                .tabItem {
                    Label("Order", systemImage: "tortoise.fill")
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
