//
//  CircleIconButtonView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 19.05.26.
//

import SwiftUI

struct CircleIconButtonView: View {
    let systemName: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: systemName)
                .font(.title3)
                .bold()
                .frame(width: 44, height: 44)
                .background(.lightDark)
                .foregroundStyle(.lightWhite)
                .clipShape(Circle())
        }
        .buttonStyle(.plain)
    }
}

#Preview {
    CircleIconButtonView(systemName: "minus") { }
    CircleIconButtonView(systemName: "plus") { }
}
