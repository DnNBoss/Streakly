//
//  EndDateView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 21.02.26.
//

import SwiftUI

struct EndDateView: View {
    @Binding var endDate: Date?

    @State private var isActive = false
    
    let startDate: Date
    
    private var minimumDate: Date {
        Calendar.current.date(byAdding: .day, value: 1, to: startDate) ?? startDate
    }
    
    private var durationBinding: Binding<Int> {
        Binding {
            guard let endDate else { return 1 }
            
            let calendar = Calendar.current
            let start = calendar.startOfDay(for: startDate)
            let end = calendar.startOfDay(for: endDate)
            
            let days = calendar.dateComponents([.day], from: start, to: end).day ?? 0
            
            return max(1, days + 1)
            
        } set: { value in
            endDate = Calendar.current.date(
                byAdding: .day,
                value: max(1, value) - 1,
                to: startDate
            )
        }
    }
    
    var body: some View {
        Toggle("End Challenge", isOn: $isActive)
            .onChange(of: isActive) {
                endDate = isActive ? minimumDate : nil
            }
        
        if isActive {
            VStack {
                HStack {
                    Text("Duration: ")
                    
                    Spacer()
                    
                    TextField("Days", value: durationBinding, format: .number)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.trailing)
                        .frame(width: 60)
                    
                    Text("days")
                        .foregroundColor(.secondary)
                }
                
                DatePicker(
                    "End Date",
                    selection: Binding(
                                get: { endDate ?? minimumDate },
                                set: { endDate = $0 }
                    ),
                    in: minimumDate...,
                    displayedComponents: .date
                )
            }
        }
    }
}

#Preview {
    @Previewable @State var endDate: Date? = nil
    Form {
        EndDateView(endDate: $endDate, startDate: .now)
    }
}
