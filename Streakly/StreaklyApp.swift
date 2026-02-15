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
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Challenge.self)
    }
}
