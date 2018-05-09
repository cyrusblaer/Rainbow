//
//  RecordViewController.swift
//  Rainbow
//
//  Created by Blaer on 2018/4/30.
//  Copyright © 2018 cyrusblaer. All rights reserved.
//

import UIKit

class RecordViewController: UIViewController {
    
    @IBOutlet weak var recordTableView: UITableView!
    
    @IBOutlet weak var noDataImage: UIImageView!
    
    @IBOutlet weak var noDataLabel: UILabel!
    var haveData: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if self.haveData {
            self.recordTableView.isHidden = false
            self.noDataImage.isHidden = true
            self.noDataLabel.isHidden = true
        }
        else {
            self.recordTableView.isHidden = true
            self.noDataImage.isHidden = false
            self.noDataLabel.isHidden = false
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
