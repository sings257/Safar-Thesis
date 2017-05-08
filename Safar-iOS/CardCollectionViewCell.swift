//
//  CardCollectionViewCell.swift
//  My_Mapbox
//
//  Created by Raha Ghassemi on 3/27/17.
//  Copyright © 2017 Raha Ghassemi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class CardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet var typeLabel: UILabel!
    @IBOutlet var categoryLabel: UILabel!
    
    var addLabel : String!
    var imageName : String!
    var numLabel : String!
    var aboutPlace : String!
    var latPlace : String!
    var longPlace : String!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var addPlace: UIButton!

    

   
    
    override func awakeFromNib() {
         super.awakeFromNib()
     

      
   
        }
    
}
