//
//  GithubQueryType.swift
//  GithubGraphQL
//
//  Created by Wellison Pereira on 2/16/19.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation

//This enum is a wrapper to instantiate a SearchRepositoriesQuery without needing separate function calls.
enum GithubQueryType: Equatable {
    case initial
    case additional(queryKey: String)
    
    var queryDetails: SearchRepositoriesQuery {
        switch self {
        case .initial:
            return SearchRepositoriesQuery(first: 20, query: "GraphQL", type: .repository)
        case .additional(let queryKey):
            return SearchRepositoriesQuery(first: 20, after: queryKey, query: "GraphQL", type: .repository)
        }
    }
    
    static func ==(lhs: GithubQueryType, rhs: GithubQueryType) -> Bool {
        switch (lhs, rhs) {
        case (.initial, .initial):
            return .initial == .initial
        case (.initial, .additional):
            return false
        default:
            return false
        }
    }
}
