//
//  ChallengeTaskScheduler.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 24.03.26.
//

import Foundation

struct ChallengeTaskScheduler {
    private let calendar = Calendar.current
    
    func makeTasks(from challenges: [Challenge], for date: Date = .now) -> [ChallengeTaskDTO] {
        challenges
            .filter { isActive($0, on: date) }
            .map { challenge in
                let dayText = makeDayText(challenge, on: date)
                let progress = todayProgress(challenge, on: date)?.done ?? 0
                let progressText = "\(progress) / \(challenge.goal)"
                let progressValue = Double(progress) / Double(challenge.goal)
                
            return ChallengeTaskDTO(
                challengeId: challenge.id,
                title: challenge.title,
                dayText: dayText,
                progressText: progressText,
                progress: progressValue)
        }
    }
    
    private func makeDayText(_ challenge: Challenge, on date: Date) -> String {
        let day = currentDay(challenge, on: date)
        
        guard let end = challenge.endDate else { return "Day \(day)" }
        
        let components = calendar.dateComponents([.day], from: challenge.startDate, to: end)
        let days = components.day ?? 0
        
        return "Day \(day) of \(max(days + 1, 1))"
    }
    
    private func currentDay(_ challenge: Challenge, on date: Date) -> Int {
        let components = calendar.dateComponents([.day], from: challenge.startDate, to: date)
        let days = components.day ?? 0
        return max(days + 1, 1)
    }
    
    private func todayProgress(_ challenge: Challenge, on date: Date) -> DailyProgress? {
        challenge.dailyProgress.first {
            calendar.isDate($0.date, inSameDayAs: date) }
    }
    
    private func isActive(_ challenge: Challenge, on date: Date) -> Bool {
        let day = calendar.startOfDay(for: date)
        let challengeDay = calendar.startOfDay(for: challenge.startDate)
        
        guard day >= challengeDay else { return false }
        
        if let endDate = challenge.endDate {
            let end = calendar.startOfDay(for: endDate)
            if day > end {
                return false
            }
        }
        
        return true
    }
}
