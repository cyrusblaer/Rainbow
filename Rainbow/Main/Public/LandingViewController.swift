//
//  LandingViewController.swift
//  Rainbow
//
//  Created by Blaer on 2018/4/26.
//  Copyright © 2018 cyrusblaer. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
    
    // MARK: Properties

    override var prefersStatusBarHidden: Bool {
        return true
    }
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let loggedIn = true
    
        // check login status
        if loggedIn {
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "tabBarVC")
            self.present(vc, animated: true, completion: nil)
        }
        else {
            let vc = self.storyboard!.instantiateViewController(withIdentifier: "welcomeVC")
            self.present(vc, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}
