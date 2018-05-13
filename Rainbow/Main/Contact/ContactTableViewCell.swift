//
//  ContactTableViewCell.swift
//  Rainbow
//
//  Created by Blaer on 2018/4/29.
//  Copyright © 2018 cyrusblaer. All rights reserved.
//

import UIKit

class ContactTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImage: RoundedImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var officailLabel: RoundedLabel!
    @IBOutlet weak var genderIcon: UIImageView!
    
    var isOfficial : Bool = false {
        didSet {
            if isOfficial {
                self.profileImage.image = UIImage(named: "icon_contacts_customer_service")
                self.nameLabel.text = "七彩客服"
                self.officailLabel.isHidden = false
                self.genderIcon.isHidden = true
            }
            else {
                self.officailLabel.isHidden = true
                self.genderIcon.isHidden = false
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
