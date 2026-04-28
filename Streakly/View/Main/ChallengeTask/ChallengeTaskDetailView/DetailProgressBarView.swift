//
//  DetailProgressBarView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 19.04.26.
//

import SwiftUI

struct CircleIconButton: View {
    let systemName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: systemName)
        }
        .font(.title3)
        .bold()
        .frame(width: 44, height: 44)
        .background(.lightDark)
        .foregroundStyle(.lightWhite)
        .clipShape(Circle())
    }
}

struct DetailProgressBarView: View {
    let progress: Double
    
    var body: some View {
        HStack {
            CircleIconButton(systemName: "minus") {
                
            }
            
            Spacer()
            
            CircularProgressBarView(
                progress: progress,
                width: 150,
                height: 150,
                lineWidth: 16,
                textColor: .lightDark,
                textFont: .title.bold()
            )
            
            Spacer()
            
            CircleIconButton(systemName: "plus") {
                
            }
        }
    }
}

#Preview {
    DetailProgressBarView(progress: 0.6)
}
