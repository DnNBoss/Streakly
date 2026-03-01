//
//  ChallengeTask.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 15.02.26.
//

import Foundation
import SwiftData

@Model
class DailyProgress {
    var id = UUID()
    var challenge: Challenge?
    var date: Date
    var done: Int
    
    var isCompleted: Bool {
        guard let challenge else { return false }
        return done >= challenge.goal
    }
    
    init(challenge: Challenge, date: Date) {
        self.challenge = challenge
        self.date = date
        self.done = 0
    }
    
    static let example = DailyProgress(challenge: .example, date: .now)
}
