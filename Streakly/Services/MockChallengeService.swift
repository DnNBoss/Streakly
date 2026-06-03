//
//  MockChallengeService.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 11.05.26.
//

import Foundation

final class MockChallengeService: ChallengeServiceProtocol {
    private let repository: any ChallengeRepositoryProtocol
    private let wrapped: ChallengeService
    
    init(repository: ChallengeRepositoryProtocol = MockChallengeRepository()) {
        self.repository = repository
        self.wrapped = ChallengeService(repository: repository)
    }
    
    func isActive(_ challenge: Challenge, on date: Date) -> Bool {
        wrapped.isActive(challenge, on: date)
    }
    
    func currentDay(_ challenge: Challenge, on date: Date) -> Int {
        wrapped.currentDay(challenge, on: date)
    }
    
    func totalDays(_ challenge: Challenge) -> Int? {
        wrapped.totalDays(challenge)
    }
    
    func currentStreak(_ challenge: Challenge, on date: Date) -> Int {
        wrapped.currentStreak(challenge, on: date)
    }
    
    func progress(for challenge: Challenge, on date: Date) -> DailyProgress? {
        DailyProgress(challenge: .example, date: .now)
    }
    
    func isCompleted(_ dailyProgress: DailyProgress) -> Bool {
        false
    }
    
    func todayTasks(for date: Date) throws -> [TaskDTO] {
        try wrapped.todayTasks(for: date)
    }
    
    func allChallenges() throws -> [Challenge] {
        try wrapped.allChallenges()
    }
    
    func addChallenge(
        title: String,
        goal: Int,
        unit: String,
        startDate: Date,
        endDate: Date?,
        repeatType: RepeatType,
        selectedWeekdays: [Weekday]
    ) throws {
        try wrapped.addChallenge(
            title: title,
            goal: goal,
            unit: unit,
            startDate: startDate,
            endDate: endDate,
            repeatType: repeatType,
            selectedWeekdays: selectedWeekdays
        )
    }
    
    func deleteChallenge(_ challenge: Challenge) throws {
        try wrapped.deleteChallenge(challenge)
    }
}

extension MockChallengeService {
    static var empty: MockChallengeService {
        MockChallengeService(repository: MockChallengeRepository.empty)
    }
    
    static var filled: MockChallengeService {
        MockChallengeService(repository: MockChallengeRepository())
    }
}
