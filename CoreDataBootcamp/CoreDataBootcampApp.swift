//
//  CoreDataBootcampApp.swift
//  CoreDataBootcamp
//
//  Created by HaYen on 17/10/24.
//

import SwiftUI

@main
struct CoreDataBootcampApp: App {
//    let persistenceController = PersistenceController.shared
    @StateObject private var vm = CoreDataViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm)
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
