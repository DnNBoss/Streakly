//
//  ContentView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 15.02.26.
//

import SwiftUI

struct ContentView: View {
    @Environment(ServiceContainer.self) private var services
    
    var body: some View {
        TabView {
            MainView(services: services)
                .tabItem {
                    Label("Main", systemImage: "house")
                }
            
            AddChallengeView(services: services)
                .tabItem {
                    Label("Add", systemImage: "plus")
                }
            
            ChallengeListView(services: services)
                .tabItem {
                    Label("Challenges", systemImage: "target")
                }
        }
    }
}

#Preview {
    ContentView()
        .environment(ServiceContainer(challengeService: MockChallengeService.filled))
}
