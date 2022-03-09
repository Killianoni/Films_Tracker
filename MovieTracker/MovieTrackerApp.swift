//
//  MovieTrackerApp.swift
//  MovieTracker
//
//  Created by Killian Adonaï on 09/03/2022.
//

import SwiftUI

@main
struct MovieTrackerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
