//
//  RoundButton.swift
//  Rainbow
//
//  Created by Blaer on 2018/4/26.
//  Copyright © 2018 cyrusblaer. All rights reserved.
//

import UIKit

class RoundedImageView: UIImageView {
    override func layoutSubviews() {
        super.layoutSubviews()
        let radius: CGFloat = self.bounds.size.width / 2.0
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}

class RoundedSelectionView: UIView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.bounds.size.height = 42
        let radius: CGFloat = self.bounds.size.height / 2.0
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        self.backgroundColor = UIColor.rbg(r: 241, g: 242, b: 245)
    }
    
}

class RoundedTextField: UITextField {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.borderStyle = .none
        self.bounds.size.height = 42
        let radius: CGFloat = self.bounds.size.height / 2.0
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        self.backgroundColor = UIColor.rbg(r: 241, g: 242, b: 245)
    }
}

class RoundedLabel: UILabel {
    override func layoutSubviews() {
        super.layoutSubviews()
        let radius: CGFloat = self.bounds.size.height / 2.0
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
    }
}

class RoundedButton: UIButton {
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        self.bounds.size.height = 42
        let radius: CGFloat = self.bounds.size.height / 2.0
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        //        self.layer.shadowOffset = CGSize.init(width: 10, height: 10)
        //        self.layer.shadowOpacity = 0.5
        //        self.layer.shadowColor = UIColor.black.cgColor
        
        let sublayer = CALayer()
        sublayer.frame = self.frame
        sublayer.backgroundColor = UIColor.black.cgColor
        sublayer.shadowOffset = CGSize.init(width: 10, height: 10)
        sublayer.shadowRadius = radius;
        sublayer.shadowOpacity = 0.8
        self.layer.addSublayer(sublayer)
        
        self.layer.masksToBounds = true
    }

}

class RoundedButtonWithBorder: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        self.bounds.size.height = 40
        let radius: CGFloat = self.bounds.size.height / 2.0
        self.layer.cornerRadius = radius
        self.clipsToBounds = true
        //        self.layer.shadowOffset = CGSize.init(width: 10, height: 10)
        //        self.layer.shadowOpacity = 0.5
        //        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.masksToBounds = true
        self.layer.borderWidth = 1
    }
}
