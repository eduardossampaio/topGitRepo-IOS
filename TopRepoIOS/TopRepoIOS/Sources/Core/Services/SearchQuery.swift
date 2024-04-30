//
//  SearchQuery.swift
//  TopRepoIOS
//
//  Created by Eduardo Sampaio on 29/04/24.
//

import Foundation

enum Languages {
    case Java
    case Kotlin
    case Swift
    
    var description : String {
        switch self {
        case .Java: return "Java"
        case .Kotlin: return "Kotlin"
        case .Swift: return "Swift"
        }
      }
}

enum SortType {
    case stars
    var description : String {
        switch self {
        case .stars: return "stars"
        }
      }
    
    
}

struct SearchQuery{
    var languages: Languages?
    var sortBy: SortType?
}
