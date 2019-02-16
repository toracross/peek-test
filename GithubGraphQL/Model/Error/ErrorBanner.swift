//
//  ErrorBanner.swift
//  GithubGraphQL
//
//  Created by Wellison Pereira on 2/16/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

final class ErrorBanner {
    
    static func displayErrorBanner(with code: ErrorCodes) {
        let alert = UIAlertController(title: code.errorDetails.0, message: code.errorDetails.1, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        
        DispatchQueue.main.async {
            UIApplication.topViewController()?.present(alert, animated: true, completion: nil)
        }
    }
}
