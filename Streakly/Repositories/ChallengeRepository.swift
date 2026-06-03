//
//  ChallengeRepository.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 26.02.26.
//

import Foundation
import SwiftData

final class ChallengeRepository: ChallengeRepositoryProtocol {
    private let modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    func fetchAll() throws -> [Challenge] {
        let descriptor = FetchDescriptor<Challenge>(
            sortBy: [SortDescriptor(\.startDate, order: .reverse)]
        )
        return try modelContext.fetch(descriptor)
    }
    
    func add(_ challenge: Challenge) throws {
        modelContext.insert(challenge)
        try save()
    }
    
    func delete(_ challenge: Challenge) throws {
        modelContext.delete(challenge)
        try save()
    }
    
    func save() throws {
        try modelContext.save()
    }
}
