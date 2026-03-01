//
//  AddChallengeView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 20.02.26.
//

import SwiftData
import SwiftUI

struct AddChallengeView: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var title = ""
    @State private var goal = 0
    @State private var unit = ""
    @State private var startDate = Date.now
    @State private var repeatType = RepeatType.weekly
    @State private var endDate: Date?
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Title") {
                    TextField("Title", text: $title)
                }
                
                Section("Goal") {
                    HStack {
                        TextField("Goal", value: $goal, format: .number)
                            .keyboardType(.numberPad)
                        
                        Divider()
                        
                        TextField("Unit", text: $unit)
                    }
                }
                
                Section("Start date") {
                    DatePicker("Start date", selection: $startDate, in: Date()..., displayedComponents: .date)
                }
                
                Section("Repeat Challenge") {
                    Picker("Repeat Challenge", selection: $repeatType) {
                        ForEach(RepeatType.allCases) { r in
                            Text(r.rawValue).tag(r)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    switch repeatType {
                    case .daily:
                        Text("Every day")
                    case .weekly:
                        WeeklyView()
                    case .monthly:
                        Text("soon...")
                    }
                }
                
                Section("End date") {
                    EndDateView(endDate: $endDate, startDate: startDate)
                }
                
                Section {
                    Button("Create") {
                        let challenge = Challenge(title: title, goal: goal, unit: unit, startDate: startDate, endDate: endDate, repeatType: repeatType)
                        
                        modelContext.insert(challenge)
                    }
                }
                .disabled(hasValidChallengeData())
            }
            .navigationTitle("Add new Challenge")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
    private func hasValidChallengeData() -> Bool {
        title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        || goal <= 0
    }
}

#Preview {
    AddChallengeView()
}
