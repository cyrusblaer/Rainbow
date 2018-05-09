//
//  AddFriendViewController.swift
//  Rainbow
//
//  Created by Blaer on 2018/4/29.
//  Copyright © 2018 cyrusblaer. All rights reserved.
//

import UIKit

class AddFriendViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var friendSearchBar: UISearchBar!
    @IBOutlet weak var searchButton: RoundedButton!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.customization()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Setup
    func customization() {
        self.searchButton.setTitleColor(.white, for: .normal)
        self.searchButton.backgroundColor = GlobalVariables.orange
        
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
