//
//  TaskDetail-ViewModel.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 20.05.26.
//

import Foundation

extension TaskDetailView {
    
    @Observable
    final class ViewModel {
        var task: TaskDTO?
        var errorMessage: String?
        
        private let service: any ChallengeServiceProtocol
        private let challenge: Challenge
        
        var completedDays: Int {
            challenge.dailyProgress.filter { progress in
                guard let c = progress.challenge else { return false }
                return progress.done >= c.goal
            }.count
        }
        
        var remainingDays: Int {
            guard let total = service.totalDays(challenge) else { return 0 }
            return max(total - service.currentDay(challenge, on: .now), 0)
        }
        
        var todayGoal: Int {
            challenge.goal
        }
        
        init(service: any ChallengeServiceProtocol, challenge: Challenge) {
            self.service = service
            self.challenge = challenge
        }
        
        func load() {
            do {
                let tasks = try service.todayTasks(for: .now)
                task = tasks.first { $0.challengeId == challenge.id }
            } catch {
                errorMessage = error.localizedDescription
            }
        }
        
        func markDone() {
            guard let task else { return }
            let remaining = task.goalAmount - task.doneAmount
            guard remaining > 0 else { return }
            
            do {
                
            } catch {
                errorMessage = error.localizedDescription
            }
        }
        
        func dismissError() {
            errorMessage = nil
        }
    }
}
