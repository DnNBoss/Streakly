//
//  ServiceContainer.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 12.05.26.
//

import Foundation
import Observation

@Observable
final class ServiceContainer {
    let challengeService: any ChallengeServiceProtocol
    
    init(challengeService: any ChallengeServiceProtocol) {
        self.challengeService = challengeService
    }
}
