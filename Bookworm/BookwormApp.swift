//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Zach Mommaerts on 10/24/23.
//

import SwiftUI

@main
struct BookwormApp: App {
    @StateObject private var dataController = DataController()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
