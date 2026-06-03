//
//  ChallengeListView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 22.02.26.
//

import SwiftData
import SwiftUI

struct ChallengeListView: View {
    @Environment(ServiceContainer.self) private var services
    
    @State private var viewModel: ViewModel
    
    init(services: ServiceContainer) {
        _viewModel = State(wrappedValue: ViewModel(challengeService: services.challengeService))
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.challenges.isEmpty {
                    Text("No challenges ...")
                } else {
                    ScrollView {
                        LazyVStack(spacing: 12) {
                            ForEach(viewModel.challenges) { challenge in
                                ChallengeCardView(challenge: challenge, service: services.challengeService)
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
            .navigationTitle("Challenges")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear {
                viewModel.load()
            }
            .alert("Error",
                   isPresented:
                    Binding(get: { viewModel.errorMessage != nil },
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
    let services = ServiceContainer(challengeService: MockChallengeService.filled)
    ChallengeListView(services: services)
        .environment(services)
}
