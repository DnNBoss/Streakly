//
//  TodayProgressView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 16.02.26.
//

import SwiftUI

struct TodayProgressView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Today progress:")
                .font(.title)
                .foregroundStyle(.lightWhite)
            
            Text("3 of 5 tasks completed")
                .font(.subheadline)
                .foregroundStyle(.lightWhite.opacity(0.8))
                .frame(maxWidth: .infinity, alignment: .trailing)
            
            LinearProgressBarView(progress: 0.6)
            
            Text("“If there is no struggle, there is no progress. - Frederick Douglass”")
                .font(.subheadline)
                .italic()
                .foregroundStyle(.lightWhite.opacity(0.8))
        }
        .padding(10)
        .frame(maxWidth: .infinity)
        .background(.lightDark)
        .clipShape(RoundedRectangle(cornerRadius: 15))
        .padding(.horizontal, 20)
    }
}

#Preview {
    TodayProgressView()
}
