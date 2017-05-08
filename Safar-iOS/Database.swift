//
//  Database.swift
//  My_Mapbox
//
//  Created by Shikha Singh on 3/10/17.
//  Copyright © 2017 Raha Ghassemi. All rights reserved.
//

import Foundation
import Firebase

class DB {
    private var dbRef : FIRDatabaseReference!
    private var cafesRef : FIRDatabaseReference
    
    init() {
        self.dbRef = FIRDatabase.database().reference()
        self.cafesRef = self.dbRef.child("Cafes")
        
    }
    
    func insertCafe(name: String, address: String, hashtags: String){
        let key = self.cafesRef.childByAutoId().key
        let cafes : NSDictionary = ["Name": name,
                                    "Address": address,
                                    "Hashtags": hashtags]
        self.cafesRef.updateChildValues(["/\(key)" : cafes])
    }
    
  
    
}

