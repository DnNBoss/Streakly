//
//  ChallengeCardView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 27.02.26.
//

import SwiftUI

struct ChallengeCardView: View {
    let challenge: Challenge
    
    private var dayText: String {
        let current = challenge.currentDay()
        
        if let total = challenge.totalDays() {
            return "Day \(current) of \(total)"
        }
        
        return "Day \(current)"
    }
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text(challenge.title)
                    .font(.title)
                    .bold()
                    .foregroundStyle(.lightWhite)
                    .lineLimit(1)
                    .padding(.trailing, 10)
               
                Spacer()
                
                CircularProgressBarView(progress: Double(challenge.goal / 100))
                    .foregroundStyle(.lightWhite)
            }
            
            HStack {
                Text(dayText)
                    .foregroundStyle(.lightWhite.opacity(0.8))
                
                Spacer()
                
                Text(challenge.isActive() ? "Active" : "Completed")
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
    ChallengeCardView(challenge: .example)
}
