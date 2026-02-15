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
    var currentValue: Int
    var tasks: [ChallengeTask] = []
    
    init(title: String, goal: Int, unit: String, startDate: Date, endDate: Date? = nil, currentValue: Int) {
        self.title = title
        self.goal = goal
        self.unit = unit
        self.startDate = startDate
        self.endDate = endDate
        self.currentValue = currentValue
    }
    
    static let example = Challenge(title: "1 day push up challenge", goal: 100, unit: "reps", startDate: Date(), endDate: Date().addingTimeInterval(86400 * 7), currentValue: 10)
}
