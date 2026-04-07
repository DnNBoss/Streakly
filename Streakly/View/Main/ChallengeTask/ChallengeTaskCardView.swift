//
//  ChallengeTaskCardView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 15.02.26.
//

import SwiftUI

struct ChallengeTaskCardView: View {
    let task: ChallengeTaskDTO
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text(task.title)
                    .font(.title)
                    .foregroundStyle(.lightWhite)
               
                Spacer()
                
                CircularProgressBarView(progress: task.progress)
            }
            
            HStack {
                Text(task.dayText)
                
                Spacer()
                
                Text(task.progressText)
            }
            .foregroundStyle(.lightWhite.opacity(0.8))
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.lightDark)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    ChallengeTaskCardView(task: .example)
        .padding()
}
