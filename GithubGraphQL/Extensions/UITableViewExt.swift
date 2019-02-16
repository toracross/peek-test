//
//  UITableViewExt.swift
//  GithubGraphQL
//
//  Created by Wellison Pereira on 2/16/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

public var initialReload: Bool = true

//This extension allows you to cascade the tableView cells based on the number of cells and duration.
extension UITableView {
    func reloadWithAnimation(withDuration duration: Double) {
        self.reloadData()
        
        if !initialReload {
            return
        }
        
        let tableViewHeight = self.bounds.size.height
        let cells = self.visibleCells
        var delayCounter = 0
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableViewHeight)
        }
        
        for cell in cells {
            UIView.animate(withDuration: duration, delay: 0.08 * Double(delayCounter), usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                cell.transform = CGAffineTransform.identity
            }, completion: nil)
            delayCounter += 1
        }
    }
}
