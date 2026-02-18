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
    
    private let shape = RoundedRectangle(cornerRadius: 12)
    
    var body: some View {
        VStack {
            Text(date.formatted(.dateTime.weekday(.narrow)))
            
            Text(date.formatted(.dateTime.day()))
        }
        .frame(width: 40, height: 60)
        .background(isSelected ? .lightDark : . lightWhite)
        .foregroundStyle(isSelected ? Color.lightWhite : Color.lightDark)
        .clipShape(shape)
        .overlay {
            shape
                .stroke(.lightDark, lineWidth: 1)
        }
    }
}

#Preview {
    DayCellView(date: .now, isSelected: false)
}
