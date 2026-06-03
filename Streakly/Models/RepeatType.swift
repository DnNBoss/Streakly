//
//  RepeatType.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 20.02.26.
//

import Foundation

enum RepeatType: String, CaseIterable, Codable, Identifiable {
    case daily
    case weekly
    case monthly
    
    var id: Self { self }
}
