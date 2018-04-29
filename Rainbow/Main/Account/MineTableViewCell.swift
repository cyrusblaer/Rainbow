//
//  MineTableViewCell.swift
//  Rainbow
//
//  Created by Blaer on 2018/4/30.
//  Copyright © 2018 cyrusblaer. All rights reserved.
//

import UIKit

class MineTableViewCell: UITableViewCell {

    @IBOutlet weak var iconView: RoundedImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var type = 0 {
        didSet {
            switch type {
            case 0:
                self.iconView.image = UIImage(named: "icon_account_security")
                self.titleLabel.text = "账号安全"
            case 1:
                self.iconView.image = UIImage(named: "icon_inviting_friends")
                self.titleLabel.text = "邀请好友"
            case 2:
                self.iconView.image = UIImage(named: "icon_customer_service")
                self.titleLabel.text = "客服"
            case 3:
                self.iconView.image = UIImage(named: "icon_setting")
                self.titleLabel.text = "设置"
            default:
                self.titleLabel.text = ""
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
