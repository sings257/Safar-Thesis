//
//  tabBar.swift
//  My_Mapbox
//
//  Created by Shikha Singh on 12/4/16.
//  Copyright © 2016 Shikha Singh. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class tabBar: UITabBarController, UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        
    UITabBar.appearance().tintColor = UIColor(red: 77/255, green: 51/255, blue: 215/255, alpha: 1.0)
    // Sets the default color of the background of the UITabBar
    UITabBar.appearance().barTintColor = UIColor.white
        UITabBarItem.appearance().setTitleTextAttributes([NSFontAttributeName: UIFont(name: "Montserrat-Bold", size: 12)!], for: UIControlState.normal)
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    }

}
