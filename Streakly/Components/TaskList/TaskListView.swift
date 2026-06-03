//
//  TaskListView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 15.02.26.
//

import SwiftUI

struct TaskListView: View {
    let tasks: [TaskDTO]
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 12) {
                ForEach(tasks) { task in
                    TaskCardView(task: task)
                }
            }
        }
    }
}

#Preview {
    let tasks = Array(repeating: TaskDTO.example, count: 10)
    TaskListView(tasks: tasks)
}
