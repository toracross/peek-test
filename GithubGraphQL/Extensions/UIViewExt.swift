//
//  UIViewExt.swift
//  GithubGraphQL
//
//  Created by Wellison Pereira on 2/16/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

//Adds a CAGradientLayer to the specified UIView
extension UIView {
    func addGradientWithColors(topColor: UIColor, bottomColor: UIColor) {
        let gradient = CAGradientLayer()
        gradient.frame = self.frame
        
        if let layers = self.layer.sublayers {
            for layer in layers where layer.name == "gradient" {
                layer.removeFromSuperlayer()
            }
        }
        
        gradient.name = "gradient"
        gradient.colors = [topColor.cgColor, bottomColor.cgColor]
        self.layer.insertSublayer(gradient, at: 0)
    }
}
