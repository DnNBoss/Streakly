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
    let services: ServiceContainer
    
    init() {
        do {
            let schema = Schema([Challenge.self, DailyProgress.self])
            let config = ModelConfiguration(schema: schema)
            modelContainer = try ModelContainer(for: schema, configurations: config)
        } catch {
            fatalError("Failed to create ModelContainer: \(error)")
        }
        
        let repo = ChallengeRepository(modelContext: modelContainer.mainContext)
        let challengeService = ChallengeService(repository: repo)
        services = ServiceContainer(challengeService: challengeService)
    }
}
