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
    
    private var durationBinding: Binding<Int> {
        Binding {
            guard let endDate else { return 1 }
            
            let calendar = Calendar.current
            let start = calendar.startOfDay(for: startDate)
            let end = calendar.startOfDay(for: endDate)
            
            let result = calendar.dateComponents([.day], from: start, to: end).day ?? 0
            
            return max(1, result + 1)
            
        } set: { value in
            endDate = Calendar.current.date(byAdding: .day, value: value - 1, to: startDate)
        }
    }
    
    var body: some View {
        Toggle("End Challenge", isOn: $isActive)
        
        if isActive {
            VStack {
                HStack {
                    Text("Duration: ")
                    
                    TextField("Duration", value: durationBinding, format: .number)
                        .keyboardType(.numberPad)
                        .multilineTextAlignment(.trailing)
                }
                
                DatePicker("End Date", selection:
                            Binding(
                                get: { endDate ?? startDate },
                                set: { endDate = $0 }),
                           in: Date()..., displayedComponents: .date)
            }
        }
    }
}

#Preview {
    EndDateView(endDate: .constant(.now), startDate: .now)
}
