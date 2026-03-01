//
//  AppDependencies.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 27.02.26.
//

import SwiftData

@MainActor
final class AppDependencies {
    let modelContainer: ModelContainer
    let repository: ChallengeRepository
    
    init() {
        let config = ModelConfiguration()
        
        do {
            modelContainer = try ModelContainer(for: Challenge.self, configurations: config)
        } catch {
            fatalError("Failed to create ModelContainer: \(error)")
        }
        
        let context = modelContainer.mainContext
        repository = ChallengeRepository(modelContext: context)
    }
}
