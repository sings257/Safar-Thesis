//
//  CardTableViewCell.swift
//  My_Mapbox
//
//  Created by Shikha Singh on 12/4/16.
//  Copyright © 2016 Shikha Singh. All rights reserved.
//

import UIKit

class CardTableViewCell: UITableViewCell {
    
    
   

  
    
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet fileprivate weak var collectionView: UICollectionView!
    
  
    

//    
//    @IBOutlet weak var placeImage: UIImageView!
//    @IBOutlet weak var distanceLabel: UILabel!
//    @IBOutlet weak var addressLabel: UILabel!
//    @IBOutlet weak var placeLabel: UILabel!
//    @IBOutlet weak var crowdDot: UIView!
//    @IBOutlet weak var crowdLabel: UILabel!
//    
//    @IBOutlet weak var backgroundCardView: UIView!
//    
//    @IBOutlet weak var plusButton: UIButton!
//    
//    let add = UIImage(named:"Check")
//    let uncheck = UIImage(named:"AddPlace")
//
//    var toggleState = 1
//
//    @IBAction func plusButton(_ sender: UIButton) {
//        if toggleState == 1 {
//            sender.setImage(add, for: .normal)
//            toggleState = 2
//        } else if toggleState == 2 {
//            sender.setImage(uncheck, for: .normal)
//            toggleState = 1
//        }
//    }
//
//    
//    
//
//
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = UITableViewCellSelectionStyle.none

    }
//
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension CardTableViewCell {
    
   
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
        
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.setContentOffset(collectionView.contentOffset, animated:false) // Stops collection view if it was scrolling.
        collectionView.reloadData()
        

        
    }
    
    var collectionViewOffset: CGFloat {
        set { collectionView.contentOffset.x = newValue }
        get { return collectionView.contentOffset.x }
    }
}

