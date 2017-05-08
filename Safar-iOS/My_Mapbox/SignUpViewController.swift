//
//  SignUpViewController.swift
//  My_Mapbox
//
//  Created by Shikha Singh on 3/10/17.
//  Copyright © 2017 Raha Ghassemi. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

class SignUpViewController : UIViewController {
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    @IBOutlet weak var Name: UITextField!
    
    @IBAction func Create(_ sender: Any) {
        let email = self.Email.text!
        let password = self.Password.text!
        let name = self.Name.text!
        
        if email != "" && password != "" && name != "" {
            FIRAuth.auth()?.createUser(withEmail: email, password: password, completion: { (user,error) in
                if error == nil {
                    let userData = ["name": name]
                    let ref = FIRDatabase.database().reference()
                    ref.child("users").child(user!.uid).setValue(userData)
                    FIREmailPasswordAuthProvider.credential(withEmail: email, password: password)
                    print("Hey! I am \(name)")

                } else{
                print(error!)
                
                }
            })
        
        } else{
            let alert = UIAlertController(title: "Error", message: "Enter email and password", preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        
    }
      
    
    @IBAction func Cancel(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }


}
