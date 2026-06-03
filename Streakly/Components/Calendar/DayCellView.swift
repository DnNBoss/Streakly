//
//  DayCellView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 18.02.26.
//

import SwiftUI

struct DayCellView: View {
    let date: Date
    let isSelected: Bool
    let isToday: Bool
    
    private let shape = RoundedRectangle(cornerRadius: 12)
    
    private var backgroundColor: Color {
        isSelected ? .lightDark : . lightWhite
    }
    
    private var foregroundColor: Color {
        isSelected ? .lightWhite : .lightDark
    }
    
    var body: some View {
        VStack(spacing: 4) {
            Text(date.formatted(.dateTime.weekday(.narrow)))
                .font(.caption2)
            
            Text(date.formatted(.dateTime.day()))
                .font(.subheadline)
                .bold()
        }
        .frame(width: 40, height: 56)
        .background(backgroundColor)
        .foregroundStyle(foregroundColor)
        .clipShape(shape)
        .overlay {
            shape
                .stroke(
                    isToday ? .lightDark : .lightDark.opacity(0.3),
                    lineWidth: isToday ? 1.5 : 1
                )
        }
    }
}

#Preview {
    DayCellView(date: .now, isSelected: false, isToday: false)
    DayCellView(date: .now, isSelected: false, isToday: true)
    DayCellView(date: .now, isSelected: true, isToday: true)
}
