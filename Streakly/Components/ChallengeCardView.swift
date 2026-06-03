//
//  ChallengeCardView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 27.02.26.
//

import SwiftUI

struct ChallengeCardView: View {
    let challenge: Challenge
    let service: any ChallengeServiceProtocol
    
    private var todayProgress: Double {
        guard challenge.goal > 0 else { return 0 }
        let done = service.progress(for: challenge, on: .now)?.done ?? 0
        
        return Double(done) / Double(challenge.goal)
    }
    
    private var dayText: String {
        let current = service.currentDay(challenge, on: .now)
        
        if let total = service.totalDays(challenge) {
            return "Day \(current) of \(total)"
        }
        
        return "Day \(current)"
    }
    
    private var statusText: String {
        if !service.isActive(challenge, on: .now) {
            return "Completed"
        }
        
        let streak = service.currentStreak(challenge, on: .now)
        return streak > 0 ? "Streak: \(streak)" : "Active"
    }
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text(challenge.title)
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.lightWhite)
                    .lineLimit(2)
                    .padding(.trailing, 10)
               
                Spacer()
                
                CircularProgressBarView(progress: todayProgress) {
                    Image(systemName: service.isActive(challenge, on: .now) ? "flame" : "checkmark")
                        .font(.title3)
                        .bold()
                        .foregroundStyle(.lightWhite)
                }
            }
            
            HStack {
                Text(dayText)
                    .foregroundStyle(.lightWhite.opacity(0.8))
                
                Spacer()
                
                Text(statusText)
                    .foregroundStyle(.lightWhite.opacity(0.8))
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.lightDark)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    let services = ServiceContainer(challengeService: MockChallengeService.filled)
    ChallengeCardView(challenge: .example, service: services.challengeService)
}
