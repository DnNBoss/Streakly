//
//  ChallengeServiceProtocol.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 8.05.26.
//

import Foundation

protocol ChallengeServiceProtocol: AnyObject {
    func todayTasks(for date: Date) throws -> [TaskDTO]
    func allChallenges() throws -> [Challenge]
    
    func isActive(_ challenge: Challenge, on date: Date) -> Bool
    func currentDay(_ challenge: Challenge, on date: Date) -> Int
    func totalDays(_ challenge: Challenge) -> Int?
    func currentStreak(_ challenge: Challenge, on date: Date) -> Int
    func progress(for challenge: Challenge, on date: Date) -> DailyProgress?
    func isCompleted(_ dailyProgress: DailyProgress) -> Bool
    
    func addChallenge(
        title: String,
        goal: Int,
        unit: String,
        startDate: Date,
        endDate: Date?,
        repeatType: RepeatType,
        selectedWeekdays: [Weekday]
        ) throws
    func deleteChallenge(_ challenge: Challenge) throws
}
