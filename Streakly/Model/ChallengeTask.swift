//
//  ChallengeTask.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 15.02.26.
//

import Foundation
import SwiftData

@Model
class ChallengeTask {
    var id = UUID()
    var challengeId: UUID?
    var title: String
    var isCompleted: Bool = false
    
    init(title: String) {
        self.title = title
    }
    
    static let example = ChallengeTask(title: "Example")
}
