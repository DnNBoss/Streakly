//
//  ChallengeRepository.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 26.02.26.
//

import Foundation
import SwiftData

@Observable
class ChallengeRepository {
    @ObservationIgnored private var modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func fetchAllChallenges() throws -> [Challenge] {
        var descriptor = FetchDescriptor<Challenge>()
        let challenges: [Challenge] = try modelContext.fetch(descriptor)
        
        return challenges
    }
    
    func addChallenge(
        title: String,
        goal: Int,
        unit: String,
        startDate: Date,
        endDate: Date?,
        repeatType: RepeatType
    ) throws {
        
        
        let challenge = Challenge(
            title: title,
            goal: goal,
            unit: unit,
            startDate: startDate,
            endDate: endDate,
            repeatType: repeatType
        )
        modelContext.insert(challenge)
        try modelContext.save()
    }
}
