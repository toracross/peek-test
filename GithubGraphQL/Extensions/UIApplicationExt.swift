//
//  UIApplicationExt.swift
//  GithubGraphQL
//
//  Created by Wellison Pereira on 2/16/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

//UIApplication Extension to grab the current top most view controller.
extension UIApplication {
    class func topViewController() -> UIViewController? {
        guard let window = UIApplication.shared.keyWindow, let rootViewController = window.rootViewController else {
            return nil
        }
        
        var topController = rootViewController
        
        while let newTopController = topController.presentedViewController {
            topController = newTopController
        }
        
        return topController
    }
}
