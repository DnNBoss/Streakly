//
//  EndDateView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 21.02.26.
//

import SwiftUI

struct EndDateView: View {
    @State private var isActive = false
    @State private var endDate: Date = Date.now
    
    private var durationBinding: Binding<Int> {
        Binding {
            let calendar = Calendar.current
            let start = calendar.startOfDay(for: startDate)
            let end = calendar.startOfDay(for: endDate)
            
            let result = calendar.dateComponents([.day], from: start, to: end).day ?? 0
            
            return max(1, result + 1)
            
        } set: { value in
            endDate = Calendar.current.date(byAdding: .day, value: value - 1, to: startDate)!
        }
    }
    
    let startDate: Date
    
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
                
                DatePicker("End Date", selection: $endDate, in: Date()..., displayedComponents: .date)
            }
        }
    }
}

#Preview {
    EndDateView(startDate: .now)
}
