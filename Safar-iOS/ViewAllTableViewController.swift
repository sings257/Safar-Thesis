//
//  ViewAllTableViewController.swift
//  My_Mapbox
//
//  Created by Raha Ghassemi on 3/28/17.
//  Copyright © 2017 Raha Ghassemi. All rights reserved.
//

import UIKit

class ViewAllTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let image = UIImage(named: "back_arrow")
        
        
        
        let backButton = UIBarButtonItem.init(title: " ", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.back(sender:)))
        backButton.image = image
        UIBarButtonItem.appearance().setBackButtonBackgroundImage(image, for: .normal, barMetrics: .default)
        
        self.navigationItem.setLeftBarButton(backButton, animated: true)
              
    }
    
    func back(sender: UIBarButtonItem) {
        
        _ = navigationController?.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

   
}
