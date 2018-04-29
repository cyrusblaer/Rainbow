//
//  MineViewController.swift
//  Rainbow
//
//  Created by Blaer on 2018/4/29.
//  Copyright © 2018 cyrusblaer. All rights reserved.
//

import UIKit

class MineViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    

    // MARK: - Properties
    @IBOutlet weak var mineTableView: UITableView!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backBarButton = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = backBarButton
        self.mineTableView.delegate = self
        self.mineTableView.dataSource = self
        self.mineTableView.tableFooterView = UIView()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //  MARK: - Delegate
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mineTableViewCell", for: indexPath) as! MineTableViewCell
        cell.type = indexPath.row
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "safetyVC")
            self.navigationController?.pushViewController(vc!, animated: true)
        case 1:
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "inviteVC")
            self.navigationController?.pushViewController(vc!, animated: true)
        case 2:
            print("open service chat")
        case 3:
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "settingVC")
            self.navigationController?.pushViewController(vc!, animated: true)
            
        default:
            print("default")
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
