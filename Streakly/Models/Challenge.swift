//
//  Challenge.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 15.02.26.
//

import Foundation
import SwiftData

@Model
final class Challenge {
    var id: UUID
    var title: String
    var goal: Int
    var unit: String
    var startDate: Date
    var endDate: Date?
    var repeatType: RepeatType
    var selectedWeekdays: [Weekday]
    
    @Relationship(deleteRule: .cascade) var dailyProgress: [DailyProgress]
    
    init(
        title: String,
        goal: Int,
        unit: String,
        startDate: Date,
        endDate: Date? = nil,
        repeatType: RepeatType,
        selectedWeekdays: [Weekday] = []
    ) {
        self.id = UUID()
        self.title = title
        self.goal = goal
        self.unit = unit
        self.startDate = startDate
        self.endDate = endDate
        self.repeatType = repeatType
        self.selectedWeekdays = selectedWeekdays
        self.dailyProgress = []
    }
}

extension Challenge {
    static var example: Challenge {
        Challenge(
            title: "1 day push up challenge",
            goal: 100,
            unit: "reps",
            startDate: Calendar.current.date(byAdding: .day, value: -2, to: .now)!,
            endDate: Calendar.current.date(byAdding: .day, value: 7, to: .now),
            repeatType: .daily
        )
    }
}
