//
//  ChallengeTask-ViewModel.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 24.03.26.
//

import Foundation

extension MainView {
    
    @Observable
    final class ViewModel {
        var tasks: [ChallengeTaskDTO] = []
        var selectedDate: Date = .now
        
        func load(repository: ChallengeRepository, scheduler: ChallengeTaskScheduler) {
            do {
                let challenges = try repository.fetchAllChallenges()
                tasks = scheduler.makeTasks(from: challenges, for: selectedDate)
            } catch {
                print(error)
            }
        }
    }
}
