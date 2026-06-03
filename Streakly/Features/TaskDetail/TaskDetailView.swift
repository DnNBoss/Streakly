//
//  TaskDetailView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 19.04.26.
//

import SwiftUI

struct TaskDetailView: View {
    @State private var viewModel: ViewModel
    
    init(challenge: Challenge, services: ServiceContainer) {
        _viewModel = State(wrappedValue: ViewModel(service: services.challengeService, challenge: challenge))
    }
    
    var body: some View {
        Group {
            if let task = viewModel.task {
                VStack(spacing: 24) {
                    VStack(spacing: 6) {
                        Text(task.title)
                            .font(.title)
                            .bold()
                            .foregroundStyle(.lightDark)
                        
                        Text(task.dayText)
                            .font(.subheadline)
                            .foregroundStyle(.secondary)
                    }
                    
                    DetailProgressBarView(progress: task.progress)
                    
                    HStack(spacing: 12) {
                        StatItemView(title: "Completed", value: viewModel.completedDays)
                        
                        StatItemView(title: "Remaining", value: viewModel.remainingDays)
                        
                        StatItemView(title: "Today goal", value: viewModel.todayGoal)
                    }
                    
                    VStack(spacing: 12) {
                        Button {
                            viewModel.markDone()
                        } label: {
                            Text("Done")
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(task.isDone ? Color.secondary : .lightDark)
                                .foregroundStyle(.lightWhite)
                                .font(.headline)
                                .clipShape(RoundedRectangle(cornerRadius: 15))
                        }
                        .disabled(task.isDone)
                        
                        Button {
                            
                        } label: {
                            Text("View Challenge")
                                .foregroundStyle(.lightDark)
                                .font(.headline)
                        }
                    }
                }
                .padding()
            } else {
                Text("Task not found...")
            }
        }
        .navigationTitle(viewModel.task?.title ?? "Task")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear { viewModel.load() }
        .alert(
            "Error",
            isPresented: Binding(
                get: { viewModel.errorMessage != nil },
                set: { if !$0 { viewModel.dismissError() } }
            )
        ) {
            Button("OK") {
                viewModel.dismissError()
            }
        } message: {
            Text(viewModel.errorMessage ?? "")
        }
    }
}

#Preview {
    TaskDetailView(challenge: .example, services: ServiceContainer(challengeService: MockChallengeService.filled)
    )
    .environment(
        ServiceContainer(
            challengeService: MockChallengeService.filled
        )
    )
}
