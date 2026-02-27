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
            VStack {
                if viewModel.challenges.isEmpty {
                    Text("No challenges ...")
                } else {
                    List(viewModel.challenges) { challenge in
                        NavigationLink {
                            Text("Detail view for \(challenge.title)")
                        } label: {
                            ChallengeCardView(challenge: challenge)
                        }
                    }
                }
            }
            .onAppear {
                viewModel.reload(repository: repository)
            }
        }
    }
}

//#Preview {
//    do {
//        let config = ModelConfiguration(isStoredInMemoryOnly: true)
//        let container = try ModelContainer(for: Challenge.self, configurations: config)
//
//        let context = container.mainContext
//        let example = Challenge(title: "1 day push up challenge", goal: 100, unit: "reps", startDate: Date().addingTimeInterval(-86400 * 2), endDate: Date().addingTimeInterval(86400 * 7), repeatType: .daily)
//
//        context.insert(example)
//
//        return ChallengeListView()
//            .environment(ChallengeRepository(modelContext: context))
//    } catch {
//        return Text("Failed to create preview: \(error.localizedDescription)")
//    }
//}
