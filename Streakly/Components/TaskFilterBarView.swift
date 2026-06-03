//
//  TaskFilterBarView.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 19.02.26.
//

import SwiftUI

struct TaskFilterBarView: View {
    @Namespace private var animation
    
    @Binding var selected: FilterType
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(FilterType.allCases) { filter in
                Text(filter.rawValue)
                    .font(.headline)
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .background(
                        filter == selected ?
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(.lightWhite)
                                    .matchedGeometryEffect(id: "filter", in: animation)
                        : nil
                    )
                    .foregroundStyle(filter == selected ? .lightDark : .lightWhite)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.25)) {
                            selected = filter
                        }
                    }
            }
        }
        .padding(6)
        .background(.lightDark)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    @Previewable @State var selected: FilterType = .all
    TaskFilterBarView(selected: $selected)
}
