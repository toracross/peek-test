//
//  ErrorCodes.swift
//  GithubGraphQL
//
//  Created by Wellison Pereira on 2/16/19.
//  Copyright © 2019 test. All rights reserved.
//

import Foundation


enum ErrorCodes {
    case genericError
    
    //errorDetails returns an error title and body.
    var errorDetails: (String, String) {
        switch self {
        case .genericError:
            return ("An error has occured.", "Please try again later.")
        }
    }
    
    
}
