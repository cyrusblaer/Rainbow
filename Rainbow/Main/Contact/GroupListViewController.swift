//
//  GroupListViewController.swift
//  Rainbow
//
//  Created by Blaer on 2018/4/29.
//  Copyright © 2018 cyrusblaer. All rights reserved.
//

import UIKit

class GroupListViewController: UIViewController,UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource {

    // MARK: - Properties
    
    @IBOutlet weak var groupSearchBar: UISearchBar!
    @IBOutlet weak var groupTableView: UITableView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.groupSearchBar.delegate = self
        self.groupTableView.delegate = self
        self.groupTableView.dataSource = self
        self.groupTableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //  MARK: - Delegate
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.groupSearchBar.resignFirstResponder()
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0{
            return 1
        }
        else {
            return 4
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    
        return 15
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    
        let header = UIView.init(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: 15))
        header.backgroundColor = GlobalVariables.tableGrey
        return header
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "groupChatCell", for: indexPath) as! GroupTableViewCell
        if indexPath.section == 0{
            cell.isAGroup = false
        }
        else {
            
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if indexPath.section == 0 {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "createGroupVC")
            self.present(vc!, animated: true, completion: nil)
            
        } else {
            
        }
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
