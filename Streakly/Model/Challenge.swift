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
    
    var start: Date {
        Calendar.current.startOfDay(for: startDate)
    }
    
    var end: Date? {
        guard let endDate else { return nil }
        
        return Calendar.current.startOfDay(for: endDate)
    }
    
    @Relationship(deleteRule: .cascade) var dailyProgress = [DailyProgress]()
    
    init(title: String, goal: Int, unit: String, startDate: Date, endDate: Date? = nil, repeatType: RepeatType) {
        self.title = title
        self.goal = goal
        self.unit = unit
        self.startDate = startDate
        self.endDate = endDate
        self.repeatType = repeatType
    }
    
    func totalDays() -> Int? {
        guard let endDate else { return nil }
        
        let days = Calendar.current.dateComponents([.day], from: startDate, to: endDate).day ?? 0
        return max(days + 1, 1)
    }
    
    func currentDay(on date: Date = .now) -> Int {
        let current = Calendar.current.startOfDay(for: date)
        
        let days = Calendar.current.dateComponents([.day], from: start, to: current).day ?? 0
        return max(days + 1, 1)
    }
    
    func isActive(on date: Date = .now) -> Bool {
        let current = Calendar.current.startOfDay(for: date)
        
        guard current >= start else { return false }
        
        if let endDate {
            return current <= endDate
        }
        
        return true
    }
    
    func progress(on date: Date) -> DailyProgress? {
        dailyProgress.first {
            Calendar.current.isDate($0.date, inSameDayAs: date) }
    }
    
    static let example = Challenge(title: "1 day push up challenge", goal: 100, unit: "reps", startDate: Date().addingTimeInterval(-86400 * 2), endDate: Date().addingTimeInterval(86400 * 7), repeatType: .daily)
}
