//
//  NewContactTableViewCell.swift
//  Rainbow
//
//  Created by Blaer on 2018/5/13.
//  Copyright © 2018 cyrusblaer. All rights reserved.
//

import UIKit

class NewContactTableViewCell: UITableViewCell {

    @IBOutlet weak var iconImage: RoundedImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var badgeLabel: RoundedLabel!
    
    var type : String = "" {
        didSet {
            if type == "newFriend" {
                self.iconImage.image = UIImage(named: "icon_new_friends")
                self.titleLabel.text = "新的好友"
                self.badgeLabel.isHidden = true
            }
            else if type == "myGroup" {
                self.iconImage.image = UIImage(named: "icon_group_chat")
                self.titleLabel.text = "我的群组"
                self.badgeLabel.isHidden = true
            }
        }
    }
    
    var unread : Int = 0 {
        didSet {
            if unread == 0 {
                badgeLabel.isHidden = true
            }
            else {
                badgeLabel.text = "\(unread)"
                badgeLabel.isHidden = false
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
