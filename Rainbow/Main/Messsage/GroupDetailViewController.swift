//
//  GroupDetailViewController.swift
//  Rainbow
//
//  Created by Blaer on 2018/5/14.
//  Copyright © 2018 cyrusblaer. All rights reserved.
//

import UIKit

class GroupDetailViewController: UIViewController {
    
    //  MARK: - Properties
    
    @IBOutlet weak var memberCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    
    //  MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.memberCollectionView.delegate = self
        self.memberCollectionView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //  MARK: - Setup
    func setNavigationBar() {
        self.navigationItem.setHidesBackButton(false, animated: false)
        let icon = UIImage.init(named: "icon_back_nor")
        let backButton = UIBarButtonItem(image: icon, style: .plain, target: self, action: #selector(self.dismissSelf))
        self.navigationItem.leftBarButtonItem = backButton
        
    }
    
    //  MARK: - Methods
    @objc func dismissSelf() {
        if let navController = self.navigationController {
            navController.popViewController(animated: true)
        }
    }

}

// MARK: - Collecton View Delegete

extension GroupDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 8 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "memberManageCell", for: indexPath) as! MemberCollectionViewCell
            cell.type = "add"
            return cell
        } else if indexPath.row == 9 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "memberManageCell", for: indexPath) as! MemberCollectionViewCell
            cell.type = "delete"
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "memberManageCell", for: indexPath)
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 8 {
            let contactsStoryboard = UIStoryboard(name: "Contacts", bundle: Bundle.main)
            let vc = contactsStoryboard.instantiateViewController(withIdentifier: "createGroupVC")
            self.present(vc, animated: true, completion: nil)
        }
    }
    
}
