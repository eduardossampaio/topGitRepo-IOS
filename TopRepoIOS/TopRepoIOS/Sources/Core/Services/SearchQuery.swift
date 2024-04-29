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
    case Python
}

enum SortType {
    case stars
}

struct SearchQuery{
    var languages: Languages?
    var sortBy: SortType?
}
