//
//  SearchViewController.swift
//  My_Mapbox
//
//  Created by Raha Ghassemi on 3/10/17.
//  Copyright © 2017 Raha Ghassemi. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        for searchButton in (self.navigationController?.navigationBar.subviews)!
        {
            
            
            searchButton.removeFromSuperview()
        }
        
        self.navigationController!.navigationBar.frame = CGRect(x:0, y:0, width: self.view.frame.size.width, height: 164.0)
        
    
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
        // Dispose of any resources that can be recreated.
    }
    

    

}
