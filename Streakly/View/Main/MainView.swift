//
//  MainView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 15.02.26.
//

import SwiftUI

struct MainView: View {
    @Environment(ChallengeRepository.self) private var repository
    private let scheduler = ChallengeTaskScheduler()
    private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                WeekStripView()
                
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
        }
    }
}

#Preview {
    @Previewable @State var dependencies = AppDependencies()
    
    MainView()
        .environment(dependencies.repository)
}
