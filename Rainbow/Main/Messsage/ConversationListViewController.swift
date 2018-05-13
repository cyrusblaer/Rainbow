//
//  ConversationListViewController.swift
//  Rainbow
//
//  Created by Blaer on 2018/4/28.
//  Copyright © 2018 cyrusblaer. All rights reserved.
//

import UIKit

class ConversationListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var conversationTableView: UITableView!
    //  MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.conversationTableView.delegate = self
        self.conversationTableView.dataSource = self
        self.conversationTableView.tableFooterView = UIView()
        self.setupNavBar()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //  MARK: - Setup
    func setupNavBar() {
         self.tabBarController?.tabBar.backgroundImage = UIImage()
         self.tabBarController?.tabBar.shadowImage = UIImage()
        self.tabBarController?.tabBar.layer.shadowOffset = CGSize(width: 0, height: -1)
        self.tabBarController?.tabBar.layer.shadowRadius = 4
        self.tabBarController?.tabBar.layer.shadowColor = UIColor.black.cgColor
        self.tabBarController?.tabBar.layer.shadowOpacity = 0.1
        let icon = UIImage.init(named: "icon_back_nor")?.withRenderingMode(.alwaysOriginal)
        let backButton = UIBarButtonItem(image: icon, style: .plain, target: self, action: nil)
//        self.navigationItem.backBarButtonItem = backButton
    }

    //  MARK: - Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        } else {
            return 10
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "groupChatVC")
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        else {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "rcConversationVC")
            self.navigationController?.pushViewController(vc!, animated: true)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if section == 0 {
            let seperator = UIView.init(frame: CGRect(x: 0, y: 0, width: GlobalVariables.kScreenWidth, height: 10))
            seperator.backgroundColor = GlobalVariables.tableGrey
            return seperator
        }
        else {
            return UIView()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "conversationCell", for: indexPath)
        
        return cell
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
