//
//  AddChallenge-ViewModel.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 2.03.26.
//

import Foundation

extension AddChallengeView {
    
    @Observable
    final class ViewModel {
        var title = ""
        var goal = 0
        var unit = ""
        var startDate = Date.now
        var repeatType = RepeatType.weekly
        var endDate: Date?
        var selectedWeekdays: Set<Weekday> = []
        var errorMessage: String?
        
        private let challengeService: any ChallengeServiceProtocol
        
        init(challengeService: any ChallengeServiceProtocol) {
            self.challengeService = challengeService
        }
        
        func save() {
            do {
                try challengeService.addChallenge(
                    title: title,
                    goal: goal,
                    unit: unit,
                    startDate: startDate,
                    endDate: endDate,
                    repeatType: repeatType,
                    selectedWeekdays: Array(selectedWeekdays.sorted())
                )
            } catch {
                errorMessage = error.localizedDescription
            }
        }
        
        func hasInvalidData() -> Bool {
            title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
            || goal <= 0
        }
        
        func dismissError() {
            errorMessage = nil
        }
    }
}
