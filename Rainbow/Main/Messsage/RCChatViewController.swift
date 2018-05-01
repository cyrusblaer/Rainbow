//
//  RCChatViewController.swift
//  Rainbow
//
//  Created by Blaer on 2018/4/30.
//  Copyright © 2018 cyrusblaer. All rights reserved.
//

import UIKit

class RCChatViewController: RCConversationViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
        self.navigationItem.setHidesBackButton(false, animated: false)
        let icon = UIImage.init(named: "icon_back_nor")?.withRenderingMode(.alwaysOriginal)
        let backButton = UIBarButtonItem(image: icon, style: .plain, target: self, action: #selector(self.dismissSelf))
        self.navigationItem.leftBarButtonItem = backButton
        
        self.chatSessionInputBarControl.emojiButton.setBackgroundImage(UIImage(named: "icon_expression_sel"), for: .normal)
        self.chatSessionInputBarControl.emojiButton.setBackgroundImage(UIImage(named: "icon_expression_sel"), for: .selected)
        self.chatSessionInputBarControl.emojiButton.setBackgroundImage(UIImage(named: "icon_expression_sel"), for: .highlighted)
        self.chatSessionInputBarControl.switchButton.setBackgroundImage(UIImage(named: "icon_more_sel"), for: .normal)
        self.chatSessionInputBarControl.pluginBoardView.insertItem(with: UIImage(named: "icon_transfer_nor"), title: "转账", at: 2, tag: 2)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //Hides current viewcontroller
    @objc func dismissSelf() {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
}
