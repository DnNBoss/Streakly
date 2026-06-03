//
//  ChallengeList-ViewModel.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 27.02.26.
//

import Foundation

extension ChallengeListView {
    
    @Observable
    final class ViewModel {
        var challenges: [Challenge] = []
        var selectedChallenge: Challenge?
        var errorMessage: String?
        
        private var challengeService: any ChallengeServiceProtocol
        
        init(challengeService: any ChallengeServiceProtocol) {
            self.challengeService = challengeService
        }
        
        func load() {
            do {
                challenges = try challengeService.allChallenges()
            } catch {
                errorMessage = error.localizedDescription
            }
        }
        
        func delete(_ challenge: Challenge) {
            do {
                try challengeService.deleteChallenge(challenge)
                load()
            } catch {
                errorMessage = error.localizedDescription
            }
        }
        
        func dismissError() {
            errorMessage = nil
        }
    }
}
