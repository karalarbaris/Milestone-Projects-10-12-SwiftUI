//
//  Milestone_Projects_10_12_SwiftUIApp.swift
//  Milestone-Projects-10-12-SwiftUI
//
//  Created by Baris Karalar on 15.07.2021.
//

import SwiftUI

@main
struct Milestone_Projects_10_12_SwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
