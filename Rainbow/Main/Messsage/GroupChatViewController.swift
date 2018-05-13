//
//  GroupChatViewController.swift
//  Rainbow
//
//  Created by Blaer on 2018/5/13.
//  Copyright © 2018 cyrusblaer. All rights reserved.
//

import UIKit

class GroupChatViewController: UIViewController {

    @IBOutlet var navigationTitleView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView?.addSubview(self.navigationTitleView)
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        self.setNavigationBar()
    
    }
    
    // MARK: - Setup
    func setNavigationBar() {
        self.navigationItem.setHidesBackButton(false, animated: false)
        let icon = UIImage.init(named: "icon_back_nor")
        let backButton = UIBarButtonItem(image: icon, style: .plain, target: self, action: #selector(self.dismissSelf))
        self.navigationItem.leftBarButtonItem = backButton
        
        let iconDetail = UIImage.init(named: "icon_friends_sel")
        let rightButton = UIBarButtonItem(image: iconDetail, style: .plain, target: self, action: #selector(self.pushToGroupDetailView))
        self.navigationItem.rightBarButtonItem = rightButton
        
        self.navigationItem.titleView = self.configureTitleView("", userCount: 20)
        
    }
    
    // MARK: - METHODS
    func configureTitleView(_ title: String, userCount: Int) -> UIView? {
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 120, height: 40))
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 120, height: 20))
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.init(name: "PingFangSC-Medium", size: 15)
        titleLabel.text = "群聊一"
        titleView.addSubview(titleLabel)
        let countLabel = UILabel(frame: CGRect(x: 26, y: 20, width: 56, height: 12))
        countLabel.textAlignment = .center
        countLabel.font = UIFont.init(name: "PingFangSC-Medium", size: 10)
        countLabel.text = "100人在线"
        titleView.addSubview(countLabel)
        let checkIcon = UIImageView(frame: CGRect(x: 82, y: 20, width: 12, height: 12))
        checkIcon.image = #imageLiteral(resourceName: "icon_have_signed_in")
        titleView.addSubview(checkIcon)
        
        return titleView
    }
    

    //Hides current viewcontroller
    @objc func dismissSelf() {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }
    
    @objc func pushToGroupDetailView() {
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
