//
//  WeekStripView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 18.02.26.
//

import SwiftUI

struct WeekStripView: View {
    @State private var selectedDate: Date = .now
    
    private var weekDates: [Date] {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: .now)
        
        return (-3...3).compactMap {
            calendar.date(byAdding: .day, value: $0, to: today)
        }
    }
    
    var body: some View {
        HStack {
            ForEach(weekDates, id: \.self) { date in
                DayCellView(date: date,
                            isSelected: Calendar.current.isDate(date, inSameDayAs: selectedDate))
                .frame(maxWidth: .infinity)
                .onTapGesture {
                    selectedDate = date
                }
            }
        }
    }
}

#Preview {
    WeekStripView()
}
