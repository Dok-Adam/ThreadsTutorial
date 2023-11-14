//
//  ProfileFilter.swift
//  Threads
//
//  Created by Адам Дотмерзаев on 14.11.2023.
//

import Foundation

enum ProfileFilter: Int, CaseIterable, Identifiable {
    case threads
    case replies
    
    var title: String {
        switch self {
        case .threads: return "Threads"
        case .replies: return "Replies"
        }
    }
    
    var id: Int { return self.rawValue }
}
