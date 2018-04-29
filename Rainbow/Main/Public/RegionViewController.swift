//
//  RegionViewController.swift
//  Rainbow
//
//  Created by Blaer on 2018/4/29.
//  Copyright © 2018 cyrusblaer. All rights reserved.
//

import UIKit

class RegionViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var regionTableView: UITableView!
    
    let regions: [String: [String : String]] = [
        "常用": ["中国大陆" : "+86",
                   "中国台湾" : "+866",
                   "中国香港" : "+852",
                   "中国澳门" : "+853"],
        "A" : ["中国大陆" : "+86",
               "中国台湾" : "+866",
               "中国香港" : "+852",
               "中国澳门" : "+853"]
    ]
    
    var selectedRegion = ["":""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.regionTableView.delegate = self
        self.regionTableView.dataSource = self
        self.regionTableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func closeVC(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "A"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "regionCell", for: indexPath)
        cell.textLabel?.text = "中国大陆"
        cell.detailTextLabel?.text = "+86"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        
        
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        //  get seleted cell before selection

        self.selectedRegion = ["中国大陆": "+86"]
        
        return indexPath
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
