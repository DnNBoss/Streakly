//
//  AddChallenge-ViewModel.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 2.03.26.
//

import Foundation

extension AddChallengeView {
    
    @Observable
    class ViewModel {
        var title = ""
        var goal = 0
        var unit = ""
        var startDate = Date.now
        var repeatType = RepeatType.weekly
        var endDate: Date?
        
        func addChallenge(repository: ChallengeRepository) {
            do {
                try repository.addChallenge(title: title, goal: goal, unit: unit, startDate: startDate, endDate: endDate, repeatType: repeatType)
            } catch {
                print(error)
            }
        }
        
        func hasInvalidChallengeData() -> Bool {
            title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            || goal <= 0
        }
    }
}
