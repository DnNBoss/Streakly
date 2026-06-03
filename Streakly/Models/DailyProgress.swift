//
//  DailyProgress.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 15.02.26.
//

import Foundation
import SwiftData

@Model
final class DailyProgress {
    var id: UUID
    var challenge: Challenge?
    var date: Date
    var done: Int
    
    init(challenge: Challenge, date: Date) {
        self.id = UUID()
        self.challenge = challenge
        self.date = Calendar.current.startOfDay(for: date)
        self.done = 0
    }
}

extension DailyProgress {
    static var sample: DailyProgress {
        DailyProgress(challenge: .example, date: .now)
    }
}
