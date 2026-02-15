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
            ChallengeTaskListView()
                .navigationTitle("Today")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    MainView()
}
