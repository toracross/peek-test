//
//  Repository.swift
//  GithubGraphQL
//
//  Created by Wellison Pereira on 2/16/19.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation

struct Repository: Codable {
    var name: String
    var path: String
    var owner: String
    var avatar: String
    var stars: Int
    
    init(name: String, path: String, owner: String, avatar: String, stars: Int) {
        self.name = name
        self.path = path
        self.owner = owner
        self.avatar = avatar
        self.stars = stars
    }
}
