//
//  Challenge-ViewModel.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 27.02.26.
//

import Foundation

extension ChallengeListView {
    
    @Observable
    final class ViewModel {
        var challenges: [Challenge] = []
        
        func reload(repository: ChallengeRepository) {
            do {
                challenges = try repository.fetchAllChallenges()
            } catch {
                print(error)
            }
        }
        
        func addChallenge(
            title: String,
            goal: Int,
            unit: String,
            startDate: Date,
            endDate: Date?,
            repeatType: RepeatType,
            repository: ChallengeRepository
        ) {
            do {
                try repository.addChallenge(
                    title: title,
                    goal: goal,
                    unit: unit,
                    startDate: startDate,
                    endDate: endDate,
                    repeatType: repeatType
                )
            } catch {
                print(error)
            }
        }
    }
}
