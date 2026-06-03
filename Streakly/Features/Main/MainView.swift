//
//  MainView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 15.02.26.
//

import SwiftUI

struct MainView: View {
    @Environment(ServiceContainer.self) private var services
    
    @State private var viewModel: ViewModel
    
    init(services: ServiceContainer) {
        _viewModel = State(wrappedValue: ViewModel(service: services.challengeService))
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                WeekStripView(selectedDate: $viewModel.selectedDate)
                
                TodayProgressView()
                
                TaskFilterBarView(selected: $viewModel.filter)
                
                if viewModel.tasks.isEmpty {
                    Spacer()
                    Text("No tasks for this day!")
                        .font(.headline)
                        .foregroundStyle(.secondary)
                
                    Text("Add a challenge to get started!")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                    
                    Spacer()
                } else {
                    TaskListView(tasks: viewModel.filteredTasks)
                }
            }
            .navigationTitle("Today")
            .navigationBarTitleDisplayMode(.inline)
            .padding(.horizontal, 20)
            .toolbar {
                Button("Settings", systemImage: "gearshape") {
                }
                .tint(.lightDark)
            }
            .onAppear {
                viewModel.load()
            }
            .onChange(of: viewModel.selectedDate) {
                viewModel.load()
            }
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
}

#Preview {
    MainView(
        services: ServiceContainer(
            challengeService: MockChallengeService.filled
        )
    )
        .environment(
            ServiceContainer(
                challengeService: MockChallengeService.filled
            )
        )
}
