//
//  ChallengeListView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 22.02.26.
//

import SwiftData
import SwiftUI

struct ChallengeListView: View {
    @Environment(ChallengeRepository.self) private var repository
    
    @State private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                if viewModel.challenges.isEmpty {
                    Text("No challenges ...")
                } else {
                    ScrollView {
                        VStack {
                            ForEach(viewModel.challenges) { challenge in
                                ChallengeCardView(challenge: challenge)
                                    .contentShape(Rectangle())
                                    .onTapGesture {
                                        viewModel.selectedChallenge = challenge
                                    }
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    .navigationDestination(item: $viewModel.selectedChallenge) { challenge in
                        Text("Detail view for \(challenge.title)")
                    }
                }
            }
            .onAppear {
                viewModel.reload(repository: repository)
            }
            .navigationTitle("Challenges")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Challenge.self, configurations: config)

        let context = container.mainContext
        let challenges = [
            Challenge(title: "1 day push up challenge", goal: 100, unit: "reps", startDate: Date().addingTimeInterval(-86400 * 2), endDate: Date().addingTimeInterval(86400 * 7), repeatType: .daily),
            Challenge(title: "2 day push up challenge", goal: 200, unit: "reps", startDate: Date().addingTimeInterval(-86400 * 2), endDate: Date().addingTimeInterval(86400 * 7), repeatType: .daily),
            Challenge(title: "3 day push up challenge", goal: 300, unit: "reps", startDate: Date().addingTimeInterval(-86400 * 2), endDate: Date().addingTimeInterval(86400 * 7), repeatType: .daily)
        ]

        challenges.forEach { context.insert($0) }

        return ChallengeListView()
            .modelContainer(container)
            .environment(ChallengeRepository(modelContext: context))
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
