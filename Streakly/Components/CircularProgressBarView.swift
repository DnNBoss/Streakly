//
//  CircularProgressBarView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 15.02.26.
//

import SwiftUI

struct CircularProgressBarView<Content: View>: View {
    let progress: Double
    let width: CGFloat
    let height: CGFloat
    let lineWidth: CGFloat
    let trackColor: Color
    let progressColor: Color?
    let content: () -> Content
    
    private var clampedProgress: Double {
        min(max(progress, 0), 1)
    }
    
    private var resolvedColor: Color {
        if let progressColor {
            return progressColor
        }
        
        switch clampedProgress {
        case ..<0.3:
            return .red
        case ..<0.6:
            return .orange
        case ..<0.9:
            return .yellow
        default:
            return .green
        }
    }
    
    init(
        progress: Double,
        width: CGFloat = 50,
        height: CGFloat = 50,
        lineWidth: CGFloat = 5,
        trackColor: Color = .gray.opacity(0.2),
        progressColor: Color? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.progress = progress
        self.width = width
        self.height = height
        self.lineWidth = lineWidth
        self.trackColor = trackColor
        self.progressColor = progressColor
        self.content = content
    }
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(trackColor, lineWidth: lineWidth)
            
            Circle()
                .trim(from: 0, to: clampedProgress)
                .stroke(
                    resolvedColor,
                    style: StrokeStyle(lineWidth: lineWidth, lineCap: .round))
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut, value: clampedProgress)
            
            content()
        }
        .frame(width: width, height: height)
    }
}

extension CircularProgressBarView where Content == Text {
    init(
        progress: Double,
         width: CGFloat = 50,
         height: CGFloat = 50,
         lineWidth: CGFloat = 5,
         textColor: Color = .lightWhite,
         textFont: Font = .subheadline
    ) {
        self.init(
            progress: progress,
            width: width,
            height: height,
            lineWidth: lineWidth
        ) {
            Text("\(Int(min(max(progress, 0), 1) * 100))%")
                .font(textFont)
                .foregroundStyle(textColor)
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
