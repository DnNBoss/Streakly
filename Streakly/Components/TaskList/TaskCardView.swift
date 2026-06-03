//
//  TaskCardView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 15.02.26.
//

import SwiftUI

struct TaskCardView: View {
    let task: TaskDTO
    
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Text(task.title)
                    .font(.title3)
                    .bold()
                    .foregroundStyle(.lightWhite)
                    .lineLimit(2)
               
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
        .background(task.isDone ? .lightDark.opacity(0.7) : .lightDark)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    TaskCardView(task: .example)
        .padding()
}
