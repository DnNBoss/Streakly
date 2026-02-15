//
//  CircularProgressBarView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 15.02.26.
//

import SwiftUI

struct CircularProgressBarView: View {
    let progress: Double
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(.lightGreen.opacity(0.2), lineWidth: 5)
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(.lightGreen, style: StrokeStyle(lineWidth: 5, lineCap: .round))
                .rotationEffect(.degrees(-90))
            
            Text("\(Int(progress * 100))%")
                .font(.subheadline)
                .foregroundStyle(.lightWhite)
        }
        .frame(width: 50, height: 50)
    }
}

#Preview {
    CircularProgressBarView(progress: 1)
        .background(.lightDark)
}
