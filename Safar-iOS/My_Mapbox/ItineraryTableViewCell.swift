//
//  ItineraryTableViewCell.swift
//  My_Mapbox
//
//  Created by Raha Ghassemi on 2/16/17.
//  Copyright © 2017 Raha Ghassemi. All rights reserved.
//

import UIKit

class ItineraryTableViewCell: UITableViewCell {

    @IBOutlet var image1: UIImageView!
    @IBOutlet var itineraryName: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = UITableViewCellSelectionStyle.none
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }

}
