//
//  TableViewCell.swift
//  PlanningSafar
//
//  Created by Raha Ghassemi on 12/3/16.
//  Copyright © 2016 Newschool. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var lineView: UIView!
    @IBOutlet var addressLabel: UILabel!
    @IBOutlet var placeLabel: UILabel!
    @IBOutlet var crowdLabel: UILabel!
    @IBOutlet var crowdDot: UIView!
    @IBOutlet var tagImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = UITableViewCellSelectionStyle.none

    
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

