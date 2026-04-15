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
            .filter { $0.isActive(on: date) }
            .map { challenge in
                let progress = challenge.progress(on: date)?.done ?? 0
                let total = challenge.totalDays()
                let current = challenge.currentDay(on: date)
                
                let dayText =
                    total != nil 
                    ? "Day \(current) of \(total!)"
                    : "Day \(current)"
            
            return ChallengeTaskDTO(
                challengeId: challenge.id,
                title: challenge.title,
                dayText: dayText,
                progressText: "\(progress) / \(challenge.goal)",
                progress: Double(progress) / Double(challenge.goal)
            )
        }
    }
}
