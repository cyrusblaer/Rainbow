//
//  MemberCollectionViewCell.swift
//  Rainbow
//
//  Created by Blaer on 2018/5/14.
//  Copyright © 2018 cyrusblaer. All rights reserved.
//

import UIKit

class MemberCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var memberProfile: RoundedImageView!
    @IBOutlet weak var memberLabel: UILabel!
    
    var type: String = "" {
        didSet {
            if type == "add" {
                self.memberProfile.image = UIImage(named: "icon_group_add_nor")
                self.memberLabel.isHidden = true
            }
            else if type == "delete" {
                self.memberProfile.image = UIImage(named: "icon_group_delete_nor")
                self.memberLabel.isHidden = true
            }
        }
    }
}
