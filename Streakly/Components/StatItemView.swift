//
//  StatItemView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 27.04.26.
//

import SwiftUI

struct StatItemView: View {
    let title: String
    let value: Int
    
    var body: some View {
        VStack(spacing: 6) {
            Text("\(value)")
                .font(.title2)
                .bold()
                .foregroundStyle(.lightDark)
            
            Text(title)
                .font(.caption)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12)
        .background(Color(.systemGray6))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    StatItemView(title: "Remaning", value: 145)
}
