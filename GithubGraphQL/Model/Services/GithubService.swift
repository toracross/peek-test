//
//  GithubService.swift
//  GithubGraphQL
//
//  Created by Wellison Pereira on 2/16/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit
import Apollo

typealias DownloadComplete = (_ : Bool, _ : [Repository]?, _ : String?) -> ()

final class GithubService {
    
    //Perform a GraphQL search via the queryType parameter, passed from the calling function.
    static func fetchRepositories(queryType: GithubQueryType, completed: @escaping DownloadComplete) {
        
        //Perform the GraphQL Query
        RepositoriesGraphQLClient.searchRepositories(query: queryType.queryDetails) { (result) in
            switch result {
            case .success(let data):
                if let gqlResult = data {
                    var repositories: [Repository] = []
                    let endCursorKey: String? = gqlResult.data?.search.pageInfo.endCursor
                    
                    gqlResult.data?.search.edges?.forEach { edge in
                        guard let repository = edge?.node?.asRepository?.fragments.repositoryDetails else { return }
                        let newRepo = Repository(name: repository.name, path: repository.url, owner: repository.owner.login, avatar: repository.owner.avatarUrl, stars: repository.stargazers.totalCount)
                        
                        repositories.append(newRepo)
                    }
                    
                    completed(true, repositories, endCursorKey)
                } else {
                    ErrorBanner.displayErrorBanner(with: .genericError)
                    completed(false, nil, nil)
                }
            case .failure(let error):
                if let error = error { debugPrint(error) }
                ErrorBanner.displayErrorBanner(with: .genericError)
                completed(false, nil, nil)
            }
        }
        
    }
}
