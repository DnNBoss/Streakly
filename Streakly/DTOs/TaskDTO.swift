//
//  TaskDTO.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 24.03.26.
//

import Foundation

struct TaskDTO: Identifiable, Hashable {
    let id: UUID
    let challengeId: UUID
    let title: String
    let dayText: String
    let progressText: String
    let progress: Double
    let isDone: Bool
    let goalAmount: Int
    let doneAmount: Int
}
 
extension TaskDTO {
    static var example: TaskDTO{
        TaskDTO(
            id: UUID(),
            challengeId: UUID(),
            title: "Test",
            dayText: "1 of 5",
            progressText: "5 / 10",
            progress: 0.5,
            isDone: false,
            goalAmount: 10,
            doneAmount: 5
        )
    }
}
