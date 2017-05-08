//
//  LogInViewController.swift
//  My_Mapbox
//
//  Created by Shikha Singh on 3/10/17.
//  Copyright © 2017 Raha Ghassemi. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

class LogInViewController : UIViewController {
    
    @IBOutlet weak var Email: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    @IBAction func LogIn(_ sender: Any) {
        let email = self.Email.text!
        let password = self.Password.text!
        
        if email != "" && password != "" {
            FIRAuth.auth()?.signIn(withEmail: email, password: password, completion: { (user, error) in
                if error == nil{
                    print("You have successfully logged in")
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "Home")
                    self.present(vc!, animated: true, completion: nil)
                    
                    
                } else {
                    print(error!)
                }
            })
        } else {
            let alert = UIAlertController(title: "Error", message: "Enter email and password", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        
        func viewDidLoad() {
            super.viewDidLoad()
            
            // 1
            FIRAuth.auth()!.addStateDidChangeListener() { auth, user in
            // 2
            if user != nil {
            // 3
            self.performSegue(withIdentifier: "LogIn", sender: nil)
            } 
        }
        }
        
           }
    
    


}
