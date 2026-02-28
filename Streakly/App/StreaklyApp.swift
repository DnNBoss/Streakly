//
//  StreaklyApp.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 15.02.26.
//

import SwiftData
import SwiftUI

@main
struct StreaklyApp: App {
    @State private var dependencies = AppDependencies()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(dependencies.modelContainer)
                .environment(dependencies.repository)
        }
    }
}
