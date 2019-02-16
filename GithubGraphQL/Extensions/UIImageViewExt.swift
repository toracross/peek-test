//
//  UIImageViewExt.swift
//  GithubGraphQL
//
//  Created by Wellison Pereira on 2/16/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

//Load an image async from a URL.
extension UIImageView {
    public func setImageFromURL(url: String) {
        self.image = UIImage(named: "github")
        URLSession.shared.dataTask(with: NSURL(string: url)! as URL, completionHandler: { (data, response, error) -> Void in
            guard error == nil else { return }
            
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
            
        }).resume()
    }
}
