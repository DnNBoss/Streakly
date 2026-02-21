//
//  Challenge.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 15.02.26.
//

import Foundation
import SwiftData

@Model
class Challenge {
    var id = UUID()
    var title: String
    var goal: Int
    var unit: String
    var startDate: Date
    var endDate: Date?
    var repeatType: RepeatType
    
    init(title: String, goal: Int, unit: String, startDate: Date, endDate: Date? = nil, repeatType: RepeatType) {
        self.title = title
        self.goal = goal
        self.unit = unit
        self.startDate = startDate
        self.endDate = endDate
        self.repeatType = repeatType
    }
    
    static let example = Challenge(title: "1 day push up challenge", goal: 100, unit: "reps", startDate: Date(), endDate: Date().addingTimeInterval(86400 * 7), repeatType: .daily)
}
