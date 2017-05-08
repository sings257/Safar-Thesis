//
//  FAQViewController.swift
//  My_Mapbox
//
//  Created by Shikha Singh on 4/16/17.
//  Copyright © 2017 Raha Ghassemi. All rights reserved.
//


import UIKit


class FAQViewController: UITableViewController {
    
    
    let questionLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = 90.0

    }
//    
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        
//    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "FAQCell", for: indexPath) as! FAQViewCell
        
        return cell
    }

}
