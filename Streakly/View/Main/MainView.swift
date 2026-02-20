//
//  MainView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 15.02.26.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                WeekStripView()
                
                TodayProgressView()
                
                TaskFilterBarView()
                
                ChallengeTaskListView()
                    .navigationTitle("Today")
                    .navigationBarTitleDisplayMode(.inline)
            }
            .padding(.horizontal, 20)
            .toolbar {
                Button("Settings", systemImage: "gearshape") {
                }
                .tint(.lightDark)
            }
        }
    }
}

#Preview {
    MainView()
}
