//
//  ProfileViewController.swift
//  My_Mapbox
//
//  Created by Shikha Singh on 3/10/17.
//  Copyright © 2017 Raha Ghassemi. All rights reserved.
//

import Foundation
import Firebase
import UIKit
import FirebaseAuth

class ProfileViewController : UIViewController{
    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let result = FIRDatabase.database().reference(withPath: "users")
        
        let ref = FIRDatabase.database().reference()

        let userID = FIRAuth.auth()?.currentUser?.uid
        ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in

            let value = snapshot.value as? NSDictionary
            let username = value?["name"] as? String ?? ""
        
            
            self.nameLabel.text = "Hey \(username),"
            }) { (error) in
                print(error.localizedDescription)
        }

        

    }
    
    @IBOutlet weak var FAQButton: UIButton!
    
    @IBAction func faq(_ segue:UIStoryboardSegue) {}
    
    @IBAction func FAQPage(_ sender: Any){
    
           
    }
    
    @IBAction func logOut(_ sender: Any) {
        
        if FIRAuth.auth()?.currentUser != nil {
            do {
                try FIRAuth.auth()?.signOut()
                let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LogIn")
                present(vc, animated: true, completion: nil)
                
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }

}
