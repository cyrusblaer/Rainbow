//
//  ContactsListViewController.swift
//  Rainbow
//
//  Created by Blaer on 2018/4/28.
//  Copyright © 2018 cyrusblaer. All rights reserved.
//

import UIKit

class ContactsListViewController: UIViewController,UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var contactSearchBar: UISearchBar!
    @IBOutlet weak var contactTableView: UITableView!
    
    //  MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.contactSearchBar.delegate = self
        self.contactTableView.delegate = self
        self.contactTableView.dataSource = self
        self.configureHeaderView()
        self.contactTableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //  MARK: - Setup
    func configureHeaderView() {
     
        let headerContainer = UIView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 88))
        headerContainer.backgroundColor = GlobalVariables.tableGrey
        
        let groupChatView = UIView.init(frame: CGRect(x: 0, y: 9, width: kScreenWidth, height: 70))
        groupChatView.backgroundColor = .white
        let groupImage = UIImageView.init(frame: CGRect(x: 16, y: 15, width: 40, height: 40))
        groupImage.image = UIImage(named: "icon_group_chat")
        groupChatView.addSubview(groupImage)
        
        let groupChatLabel = UILabel(frame: CGRect(x: 70 , y: 27, width: 50, height: 16))
        groupChatLabel.text = "我的群聊"
        groupChatLabel.font = UIFont.init(name: "PingFangSC-Medium", size: 15)
        groupChatView.addSubview(groupChatLabel)
        
        let groupChatCountLabel = UILabel(frame: CGRect(x: kScreenWidth -  90 - 16, y: 27, width: 90, height: 16))
        groupChatCountLabel.font = UIFont.init(name: "PingFangSC-Medium", size: 12)
        groupChatCountLabel.textColor = UIColor.rbg(r: 197, g: 201, b: 210)
        groupChatCountLabel.text = "共加入0个群聊"
        groupChatView.addSubview(groupChatCountLabel)
    
        headerContainer.addSubview(groupChatView)
        
        let groupChatButton = UIButton.init(frame: CGRect(x: 0, y: 9, width: kScreenWidth, height: 70))
        groupChatButton.backgroundColor = .clear
        groupChatButton.addTarget(self, action: #selector(self.groupButtonClicked), for: .touchUpInside)
        headerContainer.insertSubview(groupChatButton, aboveSubview: groupChatView)
        
//        self.contactTableView.tableHeaderView = headerContainer
    }
    //  MARK: - Methods
    @objc func groupButtonClicked() {
        print("groupButtonClicked")
        let gropListVC = self.storyboard?.instantiateViewController(withIdentifier: "groupListVC")
        self.navigationController?.pushViewController(gropListVC!, animated: true)
    }

    //  MARK: - Delegate
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.contactSearchBar.resignFirstResponder()
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 28
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 3
        }
        else {
            return 2
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0
        }
        else {
            return 20
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0{
            return UIView()
        }
        else {
            let tagHeader = UIView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 20))
            
            let tagLabel = UILabel.init(frame: CGRect(x: 16, y: 6, width: 12, height: 10))
            tagLabel.text = "A"
            tagHeader.addSubview(tagLabel)
            tagHeader.backgroundColor = GlobalVariables.tableGrey
            return tagHeader
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 && indexPath.row == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "newContactCell", for: indexPath) as! NewContactTableViewCell
            cell.type = "newFriend"
            cell.unread = 0
            return cell
        }
        else if indexPath.section == 0 && indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "newContactCell", for: indexPath) as! NewContactTableViewCell
            cell.type = "myGroup"
            return cell
        }
            
        else if indexPath.section == 0 && indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactTableViewCell
            cell.isOfficial = true
            return cell
        }
        else {
        
            let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
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
