//
//  ChallengeService.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 8.05.26.
//

import Foundation

final class ChallengeService: ChallengeServiceProtocol {
    private let repository: any ChallengeRepositoryProtocol
    private let calendar = Calendar.current
    
    init(repository: ChallengeRepositoryProtocol) {
        self.repository = repository
    }
    
    func allChallenges() throws -> [Challenge] {
        try repository.fetchAll()
    }
    
    func todayTasks(for date: Date = .now) throws -> [TaskDTO] {
        let challenges = try allChallenges()
        
        return challenges
            .filter { isActive( $0, on: date) }
            .map { makeTaskDTO(from: $0, on: date) }
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
        let challenge = Challenge(
            title: title,
            goal: goal,
            unit: unit,
            startDate: startDate,
            endDate: endDate,
            repeatType: repeatType,
            selectedWeekdays: selectedWeekdays
        )
        try repository.add(challenge)
    }
    
    func deleteChallenge(_ challenge: Challenge) throws {
        try repository.delete(challenge)
    }
    
    
    func isActive(_ challenge: Challenge, on date: Date = .now) -> Bool {
        let current = calendar.startOfDay(for: date)
        let start = calendar.startOfDay(for: challenge.startDate)
        
        guard current >= start else { return false }
        
        if let endDate = challenge.endDate {
            let end = calendar.startOfDay(for: endDate)
            guard current <= end else { return false }
        }
        
        return isScheduled(challenge, on: date)
    }
    
    func currentDay(_ challenge: Challenge, on date: Date = .now) -> Int {
        let current = calendar.startOfDay(for: date)
        let start = calendar.startOfDay(for: challenge.startDate)
        let days = calendar.dateComponents([.day], from: start, to: current).day ?? 0
        
        return max(days + 1, 1)
    }
    
    func totalDays(_ challenge: Challenge) -> Int? {
        guard let endDate = challenge.endDate else { return nil }
        let start = calendar.startOfDay(for: challenge.startDate)
        let end = calendar.startOfDay(for: endDate)
        let days = calendar.dateComponents([.day], from: start, to: end).day ?? 0
        
        return max(days + 1, 1)
    }
    
    func progress(for challenge: Challenge, on date: Date) -> DailyProgress? {
        challenge.dailyProgress.first {
            calendar.isDate($0.date, inSameDayAs: date)
        }
    }
    
    func isCompleted(_ progress: DailyProgress) -> Bool {
        guard let challenge = progress.challenge else { return false }
        
        return progress.done >= challenge.goal
    }
    
    func currentStreak(_ challenge: Challenge, on date: Date = .now) -> Int {
        var streak = 0
        var checking = calendar.startOfDay(for: date)
        
        while true {
            guard isActive(challenge, on: checking) else { break }
            
            if let progress = progress(for: challenge, on: checking), progress.done > 0 {
                streak += 1
            } else {
                break
            }
            
            guard let previous = calendar.date(byAdding: .day, value: -1, to: checking) else {
                break
            }
            checking = previous
        }
        
        return streak
    }
}

private extension ChallengeService {
    func isScheduled(_ challenge: Challenge, on date: Date) -> Bool {
        switch challenge.repeatType {
            case .daily:
            return true
        case .weekly:
            guard !challenge.selectedWeekdays.isEmpty else { return true }
            let weekday = calendar.component(.weekday, from: date)
            return challenge.selectedWeekdays.contains {
                $0.calendarWeekday == weekday
            }
        case .monthly:
            return true
        }
    }
    
    func makeTaskDTO(from challenge: Challenge, on date: Date) -> TaskDTO {
        let done = progress(for: challenge, on: date)?.done ?? 0
        let goal = challenge.goal
        let current = currentDay(challenge, on: date)
        let total = totalDays(challenge)
        
        let dayText = total.map { "Day \(current) of \($0)" } ?? "Day \(current)"
        
        return TaskDTO(
            id: challenge.id,
            challengeId: challenge.id,
            title: challenge.title,
            dayText: dayText,
            progressText: "\(done) / \(goal)",
            progress: goal > 0 ? Double(done) / Double(goal) : 0,
            isDone: done >= goal,
            goalAmount: goal,
            doneAmount: done
        )
    }
}

enum ChallengeServiceError: LocalizedError {
    case challengeNotFound(UUID)
    
    var errorDescription: String? {
        switch self {
        case .challengeNotFound(let id):
            return "Challenge with id \(id) not found."
        }
    }
}
