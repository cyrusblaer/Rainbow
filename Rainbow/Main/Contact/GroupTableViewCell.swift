//
//  GroupTableViewCell.swift
//  Rainbow
//
//  Created by Blaer on 2018/4/29.
//  Copyright © 2018 cyrusblaer. All rights reserved.
//

import UIKit

class GroupTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var profileView: RoundedImageView!
    @IBOutlet weak var groupLabel: UILabel!
    
    var isAGroup :Bool = true {
        didSet {
            if !isAGroup {
                self.profileView.image = UIImage(named: "icon_add_group_nor")
                self.groupLabel.text = "创建群聊"
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
