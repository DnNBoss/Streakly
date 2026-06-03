//
//  MockChallengeRepository.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 8.05.26.
//

import Foundation

final class MockChallengeRepository: ChallengeRepositoryProtocol {
    private(set) var challenges: [Challenge]
    private(set) var saveCallCount = 0
    
    init(challenges: [Challenge] = MockChallengeRepository.examples) {
        self.challenges = challenges
    }
    
    func fetchAll() throws -> [Challenge] {
        challenges
    }
    
    func add(_ challenge: Challenge) throws {
        challenges.append(challenge)
        try save()
    }
    
    func delete(_ challenge: Challenge) throws {
        challenges.removeAll { $0.id == challenge.id }
        try save()
    }
    
    func save() throws {
        saveCallCount += 1
    }
}

extension MockChallengeRepository {
    static var examples: [Challenge] {
        [
            Challenge(
                title: "1 day push up challenge",
                goal: 100,
                unit: "reps",
                startDate: Calendar.current.date(byAdding: .day, value: -2, to: .now)!,
                endDate: Calendar.current.date(byAdding: .day, value: 7, to: .now),
                repeatType: .daily
            ),
            Challenge(
                title: "Drink Water",
                goal: 8,
                unit: "cups",
                startDate: Calendar.current.date(byAdding: .day, value: -5, to: .now)!,
                endDate: nil,
                repeatType: .daily
            ),
            Challenge(
                title: "Read a book",
                goal: 30,
                unit: "min",
                startDate: Calendar.current.date(byAdding: .day, value: -1, to: .now)!,
                endDate: Calendar.current.date(byAdding: .day, value: 14, to: .now),
                repeatType: .weekly
            )
        ]
    }
    
    static var empty: MockChallengeRepository {
        MockChallengeRepository(challenges: [])
    }
}
