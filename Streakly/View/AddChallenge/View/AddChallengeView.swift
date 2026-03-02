//
//  AddChallengeView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 20.02.26.
//

import SwiftData
import SwiftUI

struct AddChallengeView: View {
    @Environment(ChallengeRepository.self) private var repository
    
    @State private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Title") {
                    TextField("Title", text: $viewModel.title)
                }
                
                Section("Goal") {
                    HStack {
                        TextField("Goal", value: $viewModel.goal, format: .number)
                            .keyboardType(.numberPad)
                        
                        Divider()
                        
                        TextField("Unit", text: $viewModel.unit)
                    }
                }
                
                Section("Start date") {
                    DatePicker("Start date", selection: $viewModel.startDate, in: Date()..., displayedComponents: .date)
                }
                
                Section("Repeat Challenge") {
                    Picker("Repeat Challenge", selection: $viewModel.repeatType) {
                        ForEach(RepeatType.allCases) { r in
                            Text(r.rawValue).tag(r)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    switch viewModel.repeatType {
                    case .daily:
                        Text("Every day")
                    case .weekly:
                        WeeklyView()
                    case .monthly:
                        Text("soon...")
                    }
                }
                
                Section("End date") {
                    EndDateView(endDate: $viewModel.endDate, startDate: viewModel.startDate)
                }
                
                Section {
                    Button("Create") {
                        viewModel.addChallenge(repository: repository)
                    }
                }
                .disabled(viewModel.hasInvalidChallengeData())
            }
            .navigationTitle("Add new Challenge")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Challenge.self, configurations: config)

        let context = container.mainContext
        let example = Challenge(title: "1 day push up challenge", goal: 100, unit: "reps", startDate: Date().addingTimeInterval(-86400 * 2), endDate: Date().addingTimeInterval(86400 * 7), repeatType: .daily)

        context.insert(example)

        return AddChallengeView()
            .environment(ChallengeRepository(modelContext: context))
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
