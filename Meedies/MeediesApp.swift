//
//  MeediesApp.swift
//  Meedies
//
//  Created by Misha Causur on 10.01.2022.
//

import SwiftUI

@main
struct MeediesApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
