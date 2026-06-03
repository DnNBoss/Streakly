//
//  FilterType.swift
//  Streakly
//
//  Created by Дмитрий Козлов on 28.05.26.
//

import Foundation

enum FilterType: String, CaseIterable, Identifiable {
    case all = "All",
         inProgress = "In progress",
         completed = "Completed"
    
    var id: Self { self }
}
