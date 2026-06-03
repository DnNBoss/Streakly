//
//  Weekday.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 28.05.26.
//

import Foundation

enum Weekday: Int, Codable, CaseIterable, Comparable, Identifiable {
    case monday = 1, tuesday, wednesday, thursday, friday, saturday, sunday
    
    var id: Self { self }
    
    var shortTitle: String {
        switch self {
        case .monday: return "Mon"
        case .tuesday: return "Tue"
        case .wednesday: return "Wed"
        case .thursday: return "Thu"
        case .friday: return "Fri"
        case .saturday: return "Sat"
        case .sunday: return "Sun"
        }
    }
    
    var calendarWeekday: Int {
        rawValue == 7 ? 1 : rawValue + 1
    }
    
    static func < (lhs: Weekday, rhs: Weekday) -> Bool {
        lhs.rawValue < rhs.rawValue
    }
}
