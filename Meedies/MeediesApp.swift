//
//  MeediesApp.swift
//  Meedies
//
//  Created by Misha Causur on 10.01.2022.
//

import SwiftUI
import Firebase
@main
struct MeediesApp: App {
    let persistenceController = PersistenceController.shared

    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
