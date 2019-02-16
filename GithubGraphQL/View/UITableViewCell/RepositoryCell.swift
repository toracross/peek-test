//
//  RepositoryCell.swift
//  GithubGraphQL
//
//  Created by Wellison Pereira on 2/16/19.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class RepositoryCell: UITableViewCell {
    
    @IBOutlet weak var repoLbl: UILabel!
    @IBOutlet weak var repoOwnerImg: UIImageView!
    @IBOutlet weak var repoRatingLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        repoOwnerImg.layer.cornerRadius = repoOwnerImg.frame.size.width / 2;
        repoOwnerImg.clipsToBounds = true
    }
    
    func set(repo: Repository) {
        self.repoLbl.text = "\(repo.owner)/\(repo.name)"
        self.repoOwnerImg.setImageFromURL(url: repo.avatar)
        self.repoRatingLbl.text = "\(repo.stars)"
    }
}
