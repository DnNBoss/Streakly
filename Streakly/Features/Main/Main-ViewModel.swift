//
//  Main-ViewModel.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 24.03.26.
//

import Foundation

extension MainView {
    
    @Observable
    final class ViewModel {
        var tasks: [TaskDTO] = []
        var selectedDate: Date = .now
        var filter: FilterType = .all
        var errorMessage: String?
        
        private let service: any ChallengeServiceProtocol
        
        var filteredTasks: [TaskDTO] {
            switch filter {
            case .all:
                tasks
            case .inProgress:
                tasks.filter { !$0.isDone }
            case .completed:
                tasks.filter { $0.isDone }
            }
        }
        
        init(service: any ChallengeServiceProtocol) {
            self.service = service
        }
        
        func load() {
            do {
                tasks = try service.todayTasks(for: selectedDate)
            } catch {
                errorMessage = error.localizedDescription
            }
        }
        
        func dismissError() {
            errorMessage = nil
        }
    }
}
