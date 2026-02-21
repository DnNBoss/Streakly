//
//  WeeklyView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 20.02.26.
//

import SwiftUI

enum Weekday: String, CaseIterable, Identifiable {
    case mon, tue, wed, thu, fri, sat, sun
    
    var id: Self { self }
}

struct WeeklyView: View {
    @State private var allDays: Bool = false
    @State private var selectedDays: Set<Weekday> = []
    
    private let shape = RoundedRectangle(cornerRadius: 6)
    
    var body: some View {
        VStack {
            Toggle("All Days", isOn: $allDays)
                .frame(maxWidth: .infinity)
                .onChange(of: allDays) { _ , newValue in
                    updateAllDays(newValue)
                }
            
            HStack(spacing: 10) {
                ForEach(Weekday.allCases) { day in
                    Text(day.rawValue.capitalized)
                        .frame(maxWidth: .infinity)
                        .frame(height: 40)
                        .font(.subheadline)
                        .background(selectedDays.contains(day) ? .lightDark : .lightWhite)
                        .foregroundStyle(selectedDays.contains(day) ? .lightWhite : .lightDark)
                        .clipShape(shape)
                        .overlay {
                            shape
                                .stroke(.lightDark, lineWidth: 1)
                        }
                        .onTapGesture {
                           toggleDay(day)
                        }
                }
            }
        }
    }
    
    private func updateAllDays(_ isOn: Bool) {
        if isOn {
            selectedDays = Set(Weekday.allCases)
        } else if selectedDays.count == Weekday.allCases.count {
            selectedDays.removeAll()
        }
    }
    
    private func toggleDay(_ day: Weekday) {
        if selectedDays.contains(day) {
            selectedDays.remove(day)
        } else {
            selectedDays.insert(day)
        }
        
        allDays = selectedDays.count == Weekday.allCases.count
    }
}

#Preview {
    WeeklyView()
}
