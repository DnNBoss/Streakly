//
//  DetailProgressBarView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 19.04.26.
//

import SwiftUI

struct DetailProgressBarView: View {
    let progress: Double
    
    var body: some View {
        HStack {
            CircleIconButtonView(systemName: "minus") {
                
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
            
            CircleIconButtonView(systemName: "plus") {
                
            }
        }
    }
}

#Preview {
    DetailProgressBarView(progress: 0.6)
}
