//
//  MainView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 15.02.26.
//

import SwiftUI

struct MainView: View {
    @Environment(ChallengeRepository.self) private var repository
    
    @State private var viewModel = ViewModel()
    
    private let scheduler = ChallengeTaskScheduler()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                WeekStripView(selectedDate: $viewModel.selectedDate)
                
                TodayProgressView()
                
                TaskFilterBarView()
                
                ChallengeTaskListView(tasks: viewModel.tasks)
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
                viewModel.load(repository: repository, scheduler: scheduler)
            }
            .onChange(of: viewModel.selectedDate) {
                viewModel.load(repository: repository, scheduler: scheduler)
            }
        }
    }
}

#Preview {
    @Previewable @State var dependencies = AppDependencies()
    
    MainView()
        .environment(dependencies.repository)
}
