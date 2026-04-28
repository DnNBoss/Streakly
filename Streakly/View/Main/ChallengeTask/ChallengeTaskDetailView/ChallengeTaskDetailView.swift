//
//  ChallengeTaskDetailView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 19.04.26.
//

import SwiftUI

struct ChallengeTaskDetailView: View {
    var task: ChallengeTaskDTO
    
    var body: some View {
        VStack(spacing: 24) {
            VStack(spacing: 6) {
                Text(task.title)
                    .font(.title)
                    .bold()
                    .foregroundStyle(.lightDark)
                
                Text(task.dayText)
                    .font(.subheadline)
                    .foregroundStyle(.lightDark)
            }
            
            DetailProgressBarView(progress: task.progress)
            
            HStack(spacing: 12) {
                StatItemView(title: "Completed", value: 0)
                
                StatItemView(title: "Remaining", value: 0)
                
                StatItemView(title: "Today goal", value: 0)
            }
            
            VStack(spacing: 12) {
                Button {
                    
                } label: {
                    Text("Done")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(.lightDark)
                        .foregroundStyle(.lightWhite)
                        .font(.headline)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                }
                
                Button {
                    
                } label: {
                    Text("View Challenge")
                        .foregroundStyle(.lightDark)
                        .font(.headline)
                }
            }
        }
        .padding()
    }
}

#Preview {
    ChallengeTaskDetailView(task: .example)
}
