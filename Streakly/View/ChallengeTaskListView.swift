//
//  ChallengeTaskListView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 15.02.26.
//

import SwiftUI

struct ChallengeTaskListView: View {
    var body: some View {
        ScrollView {
            ForEach(0..<20) { _ in
                ChallengeTaskCardView(task: .example)
                    .padding(.bottom, 10)
            }
        }
    }
}

#Preview {
    ChallengeTaskListView()
}
