//
//  ChallengeTaskListView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 15.02.26.
//

import SwiftUI

struct ChallengeTaskListView: View {
    let tasks: [ChallengeTaskDTO]
    
    var body: some View {
        ScrollView {
            ForEach(tasks) { task in
                ChallengeTaskCardView(task: task)
            }
        }
    }
}

#Preview {
    let tasks = Array(repeating: ChallengeTaskDTO.example, count: 10)
    
    ChallengeTaskListView(tasks: tasks)
}
