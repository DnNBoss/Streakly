//
//  WeeklyView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 20.02.26.
//

import SwiftUI

struct WeeklyView: View {
    @Binding var selectedDays: Set<Weekday>
    
    private let shape = RoundedRectangle(cornerRadius: 6)
    
    private var allDays: Binding<Bool> {
        Binding(
            get: { selectedDays.count == Weekday.allCases.count },
            set: { isOn in
                selectedDays = isOn ? Set(Weekday.allCases) : []
            }
        )
    }
    
    var body: some View {
        VStack {
            Toggle("All Days", isOn: allDays)
                .frame(maxWidth: .infinity)
            
            HStack(spacing: 6) {
                ForEach(Weekday.allCases) { day in
                    Text(day.shortTitle)
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
    
    private func toggleDay(_ day: Weekday) {
        if selectedDays.contains(day) {
            selectedDays.remove(day)
        } else {
            selectedDays.insert(day)
        }
    }
}

#Preview {
    @Previewable @State var selectedDays: Set<Weekday> = [.monday, .wednesday, .friday]
    WeeklyView(selectedDays: $selectedDays)
}
