//
//  SignInViewController.swift
//  Rainbow
//
//  Created by Blaer on 2018/4/30.
//  Copyright © 2018 cyrusblaer. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let backBarButton = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = backBarButton
        let recordButton = UIBarButtonItem(title: "收支明细", style: .plain, target: self, action: #selector(self.pushToRecordVC))
        self.navigationItem.rightBarButtonItem = recordButton
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Methods
    @objc func pushToRecordVC() {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "recordVC") as! RecordViewController
        vc.haveData = false
        self.navigationController?.pushViewController(vc, animated: true)
        
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
