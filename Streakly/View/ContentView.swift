//
//  ContentView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 15.02.26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem {
                    Label("Main", systemImage: "house")
                }
            
            AddChallengeView()
                .tabItem {
                    Label("Add", systemImage: "plus")
                }
            
            ChallengeListView()
                .tabItem {
                    Label("Challenges", systemImage: "target")
                }
        }
    }
}

#Preview {
    @Previewable @State var dependencies = AppDependencies()
    
    ContentView()
        .modelContainer(dependencies.modelContainer)
        .environment(dependencies.repository)
}
