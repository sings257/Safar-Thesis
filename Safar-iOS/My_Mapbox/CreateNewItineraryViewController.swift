//
//  CreateNewItineraryViewController.swift
//  My_Mapbox
//
//  Created by Raha Ghassemi on 3/14/17.
//  Copyright © 2017 Raha Ghassemi. All rights reserved.
//

import UIKit

class CreateNewItineraryViewController: UIViewController {

    @IBOutlet weak var itineraryName: UITextField!

    var name: String = ""
  
    override func viewDidLoad() {
        super.viewDidLoad()

        createNewButton.removeFromSuperview()

        // Do any additional setup after loading the view.
    }
    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "doneSegue" {
            name = itineraryName.text!
        }
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
