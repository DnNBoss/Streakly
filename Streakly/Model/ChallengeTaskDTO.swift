//
//  ChallengeTaskDTO.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 24.03.26.
//

import Foundation

struct ChallengeTaskDTO: Identifiable {
    let id = UUID()
    let challengeId: UUID
    let title: String
    let dayText: String
    let progressText: String
    let progress: Double
    
    static let example = ChallengeTaskDTO(challengeId: UUID(), title: "Test", dayText: "1 of 5", progressText: "5 / 10", progress: 0.5)
}
