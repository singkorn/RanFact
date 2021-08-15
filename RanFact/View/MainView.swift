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
            YearView()
                .tabItem {
                    Label("Year", systemImage: "calendar")
                }
            TriviaView()
                .tabItem {
                    Label("Trivia", systemImage: "questionmark.circle")
                }
            RandomView()
                .tabItem {
                    Label("Random Number", systemImage: "shuffle")
                }
           MathView()
                .tabItem {
                    Label("Math", systemImage: "number.square")
                }
            DateView()
                .tabItem {
                    Label("Date", systemImage: "calendar.circle")
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

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
