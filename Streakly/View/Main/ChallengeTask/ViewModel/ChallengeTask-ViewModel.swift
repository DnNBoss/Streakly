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
        
        func load(repository: ChallengeRepository, scheduler: ChallengeTaskScheduler, for date: Date = .now) {
            do {
                let challenges = try repository.fetchAllChallenges()
                tasks = scheduler.makeTasks(from: challenges, for: date)
            } catch {
                print(error)
            }
        }
    }
}
