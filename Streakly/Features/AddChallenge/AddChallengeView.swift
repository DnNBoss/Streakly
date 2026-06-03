//
//  AddChallengeView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 20.02.26.
//

import SwiftData
import SwiftUI

struct AddChallengeView: View {
    @Environment(ServiceContainer.self) private var services
    @Environment(\.dismiss) private var dismiss
    
    @State private var viewModel: ViewModel
    
    init(services: ServiceContainer) {
        _viewModel = State(wrappedValue: ViewModel(challengeService: services.challengeService))
    }
    
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
                    DatePicker(
                        "Start date",
                        selection: $viewModel.startDate,
                        in: Date()...,
                        displayedComponents: .date
                    )
                }
                
                Section("Repeat Challenge") {
                    Picker("Repeat Challenge", selection: $viewModel.repeatType) {
                        ForEach(RepeatType.allCases) { type in
                            Text(type.rawValue).tag(type)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    switch viewModel.repeatType {
                    case .daily:
                        Text("Every day")
                    case .weekly:
                        WeeklyView(selectedDays: $viewModel.selectedWeekdays)
                    case .monthly:
                        Text("soon...")
                    }
                }
                
                Section("End date") {
                    EndDateView(endDate: $viewModel.endDate, startDate: viewModel.startDate)
                }
                
                Section {
                    Button("Create") {
                        viewModel.save()
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .disabled(viewModel.hasInvalidData())
                }
            }
            .navigationTitle("Add new Challenge")
            .navigationBarTitleDisplayMode(.inline)
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
    AddChallengeView(services: services)
        .environment(services)
}
