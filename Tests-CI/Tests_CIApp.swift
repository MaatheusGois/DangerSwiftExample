//
//  Tests_CIApp.swift
//  Tests-CI
//
//  Created by Matheus Gois on 05/04/24.
//

import SwiftUI
import SwiftData

@main
struct Tests_CIApp: App {
    var container: ModelContainer = {
        let schema = Schema([
            Item.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView(modelContext: container.mainContext)
        }
        .modelContainer(container)
    }
}
