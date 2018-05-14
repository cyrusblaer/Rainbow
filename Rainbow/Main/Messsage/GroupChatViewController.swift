//
//  GroupChatViewController.swift
//  Rainbow
//
//  Created by Blaer on 2018/5/13.
//  Copyright © 2018 cyrusblaer. All rights reserved.
//

import UIKit

class GroupChatViewController: UIViewController {
    
    @IBOutlet weak var memberCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.memberCollectionView.delegate = self
        self.memberCollectionView.dataSource = self
        
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
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "groupDetailVC")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    
}

// MARK: - Collecton View Delegete

extension GroupChatViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "memberCell", for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let contactsStoryboard = UIStoryboard(name: "Contacts", bundle: Bundle.main)
        let vc = contactsStoryboard.instantiateViewController(withIdentifier: "userProfileVC")
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}


