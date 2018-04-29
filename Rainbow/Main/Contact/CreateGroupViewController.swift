//
//  CreateGroupViewController.swift
//  Rainbow
//
//  Created by Blaer on 2018/4/29.
//  Copyright © 2018 cyrusblaer. All rights reserved.
//

import UIKit

class CreateGroupViewController: UIViewController,UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource {

    // MARK: - Properties
    
    @IBOutlet weak var contactSearchBar: UISearchBar!
    @IBOutlet weak var contactTableView: UITableView!
    @IBOutlet weak var confirmButton: RoundedButton!
    @IBOutlet weak var countLabel: UILabel!
    
    var totalContactsCount = 100
    var selectedCount : Int = 0 {
        didSet {
            self.countLabel.text = "已选择：\(selectedCount)人"
            self.confirmButton.setTitle("确定（\(selectedCount)/\(totalContactsCount)）", for: .normal)
        }
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.contactSearchBar.delegate = self
        self.contactTableView.delegate = self
        self.contactTableView.dataSource = self
        self.contactTableView.tableFooterView = UIView()
        self.contactTableView.isEditing = true
        self.customization()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //  MARK: - Setup
    func customization() {
        
        self.confirmButton.setTitleColor(.white, for: .normal)
        self.confirmButton.backgroundColor = GlobalVariables.orange
        
        
    }
    
    //  MARK - Action
    @IBAction func confirmAction(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func closeVC(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
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
        
        return 12
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            let header = UIView.init(frame: CGRect(x: 0, y: 0, width: GlobalVariables.kScreenWidth, height: 12))
            header.backgroundColor = .white
            let label = UILabel(frame: CGRect(x: 17, y: 0, width: 60, height: 12))
            label.textColor = UIColor.rbg(r: 28, g: 3, b: 40)
            label.font = UIFont(name: "PingFangSC-Medium", size: 12)
            label.text = "常用联系人"
            header.addSubview(label)
            return header
        } else {
            let header = UIView.init(frame: CGRect(x: 0, y: 0, width: GlobalVariables.kScreenWidth, height: 12))
            header.backgroundColor = GlobalVariables.tableGrey
            return header
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath)
        cell.selectionStyle = .default
        cell.selectedBackgroundView = UIView()
        cell.tintColor = GlobalVariables.orange
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedCount += 1
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        self.selectedCount -= 1
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
