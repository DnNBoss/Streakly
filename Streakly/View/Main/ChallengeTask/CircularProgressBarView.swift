//
//  CircularProgressBarView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 15.02.26.
//

import SwiftUI

struct CircularProgressBarView<Content: View>: View {
    let progress: Double
    let content: () -> Content
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(.lightGreen.opacity(0.2), lineWidth: 5)
            
            Circle()
                .trim(from: 0, to: progress)
                .stroke(.lightGreen, style: StrokeStyle(lineWidth: 5, lineCap: .round))
                .rotationEffect(.degrees(-90))
            
            content()
        }
        .frame(width: 50, height: 50)
    }
    
    init(progress: Double, content: @escaping () -> Content) {
        self.progress = progress
        self.content = content
    }
}

extension CircularProgressBarView where Content == Text {
    init(progress: Double) {
        self.progress = progress
        self.content = {
            Text("\(Int(progress * 100))%")
                .font(.subheadline)
                .foregroundStyle(.lightWhite)
        }
    }
}

#Preview {
    CircularProgressBarView(progress: 1) {
        Image(systemName: "pause")
            .font(.title)
            .bold()
            .foregroundStyle(.lightWhite)
    }
        .background(.lightDark)
}
