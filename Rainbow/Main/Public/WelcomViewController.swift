//
//  WelcomViewController.swift
//  Rainbow
//
//  Created by Blaer on 2018/4/26.
//  Copyright © 2018 cyrusblaer. All rights reserved.
//

import UIKit

class WelcomViewController: UIViewController {

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    // MARK: - Properties
    @IBOutlet weak var loginButton: RoundedButton!
    @IBOutlet weak var registerbutton: RoundedButtonWithBorder!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        self.customization()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // MARK: - Setup
    func customization() {
        
        self.loginButton.setTitleColor(.white, for: .normal)
            self.loginButton.backgroundColor = GlobalVariables.orange
            self.registerbutton.setTitleColor(GlobalVariables.orange, for: .normal)
            self.registerbutton.layer.borderColor = GlobalVariables.orange.cgColor
        
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "registerSegue" {
            let vc = segue.destination as! LoginViewController
            vc.shouldShowPage = .register
        }
        else if segue.identifier == "loginSegue" {
            let vc = segue.destination as! LoginViewController
            vc.shouldShowPage = .login
        }
    }
    

}
