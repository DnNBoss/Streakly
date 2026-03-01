//
//  ChallengeCardView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 27.02.26.
//

import SwiftUI

struct ChallengeCardView: View {
    let challenge: Challenge
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text(challenge.title + challenge.title)
                    .font(.title)
                    .bold()
                    .foregroundStyle(.lightWhite)
                    .lineLimit(1)
               
                Spacer()
                
                CircularProgressBarView(progress: Double(challenge.goal / 100))
                    .foregroundStyle(.lightWhite)
            }
            
            HStack {
                Text("\(challenge.startDate)")
                    .foregroundStyle(.lightWhite.opacity(0.8))
                
                Spacer()
                
                Text(challenge.title)
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
