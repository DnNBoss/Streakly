//
//  ChallengeTaskCardView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 15.02.26.
//

import SwiftUI

struct ChallengeTaskCardView: View {
    let task: ChallengeTask
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text(task.title)
                    .font(.title)
                    .foregroundStyle(.lightWhite)
               
                Spacer()
                
                CircularProgressBarView(progress: 0.55)
                    .foregroundStyle(.lightWhite)
            }
            
            HStack {
                Text("Day 1 / 100")
                    .foregroundStyle(.lightWhite.opacity(0.8))
                
                Spacer()
                
                Text("0 / 1 reps")
                    .foregroundStyle(.lightWhite.opacity(0.8))
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.lightDark)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .padding(.horizontal, 20)
    }
}

#Preview {
    ChallengeTaskCardView(task: .example)
}
