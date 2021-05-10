//
//  RanFactApp.swift
//  RanFact
//
//  Created by Singkorn Dhepyasuvan on 10/5/2564 BE.
//

import SwiftUI

@main
struct RanFactApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
