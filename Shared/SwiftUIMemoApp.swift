//
//  SwiftUIMemoApp.swift
//  Shared
//
//  Created by IMStudio on 2023/01/17.
//

import SwiftUI

@main
struct SwiftUIMemoApp: App {
    
    @StateObject var store = MemoStore()
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(store)
        }
    }
}
