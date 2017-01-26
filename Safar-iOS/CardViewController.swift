//
//  CardViewController.swift
//  My_Mapbox
//
//  Created by Shikha Singh on 12/4/16.
//  Copyright © 2016 Shikha Singh. All rights reserved.
//

import UIKit

class CardViewController: UITableViewController {

    @IBOutlet weak var scrollView: UIScrollView!

    
    let data = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 154.0
        
        let allButton = UIButton(frame: CGRect(x: 14, y: 4, width: 50, height: 50))
        allButton.setImage(UIImage(named: "all_button"), for: .normal)
        allButton.layer.shadowColor = UIColor.black.withAlphaComponent(0.3).cgColor
        allButton.layer.shadowOffset = CGSize(width: 0, height: 0)
        allButton.layer.shadowOpacity = 0.8
        
        let foodButton = UIButton(frame: CGRect(x: 78, y: 4, width: 50, height: 50))
        foodButton.setImage(UIImage(named: "food-1"), for: .normal)
        
        let parkButton = UIButton(frame: CGRect(x: 142, y: 4, width: 50, height: 50))
        parkButton.setImage(UIImage(named: "parks-1"), for: .normal)
        
        let landButton = UIButton(frame: CGRect(x: 206, y: 4, width: 50, height: 50))
        landButton.setImage(UIImage(named: "landmark-1"), for: .normal)
        
        let cultureButton = UIButton(frame: CGRect(x: 270, y: 4, width: 50, height: 50))
        cultureButton.setImage(UIImage(named: "culture-1"), for: .normal)
        
        let marketButton = UIButton(frame: CGRect(x: 334, y: 4, width: 50, height: 50))
        marketButton.setImage(UIImage(named: "market-1"), for: .normal)
        
        let shopButton = UIButton(frame: CGRect(x: 398, y: 4, width: 50, height: 50))
        shopButton.setImage(UIImage(named: "shop-1"), for: .normal)
        
        let bikeButton = UIButton(frame: CGRect(x: 462, y: 4, width: 50, height: 50))
        bikeButton.setImage(UIImage(named: "bike-1"), for: .normal)
        
        let coffeeButton = UIButton(frame: CGRect(x: 526, y: 4, width: 50, height: 50))
        coffeeButton.setImage(UIImage(named: "coffee-1"), for: .normal)
        
        let barButton = UIButton(frame: CGRect(x: 590, y: 4, width: 50, height: 50))
        barButton.setImage(UIImage(named: "bar-1"), for: .normal)
        
        let wifiButton = UIButton(frame: CGRect(x: 654, y: 4, width: 50, height: 50))
        wifiButton.setImage(UIImage(named: "wifi-1"), for: .normal)
        

        self.scrollView.addSubview(allButton)
        self.scrollView.addSubview(foodButton)
        self.scrollView.addSubview(parkButton)
        self.scrollView.addSubview(landButton)
        self.scrollView.addSubview(cultureButton)
        self.scrollView.addSubview(marketButton)
        self.scrollView.addSubview(shopButton)
        self.scrollView.addSubview(bikeButton)
        self.scrollView.addSubview(coffeeButton)
        self.scrollView.addSubview(barButton)
        self.scrollView.addSubview(wifiButton)
        
        scrollView.contentSize = CGSize(width: 718, height: 56);
        scrollView.contentOffset = CGPoint(x:0, y:0);
        
        
    }
    
   
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.places.count
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let card = tableView.dequeueReusableCell(withIdentifier: "Card", for: indexPath) as! CardTableViewCell
        
        let entry = data.places[indexPath.row]
        
        
        card.crowdDot.layer.cornerRadius = 5.0
        card.addressLabel.text = entry.Address
        card.placeLabel.text = entry.Location
        card.distanceLabel.text = entry.Distance
        card.crowdLabel.text = entry.Crowd.uppercased()
        card.placeImage.image = UIImage(named: entry.Image)
        
        card.placeImage.layer.cornerRadius = 12.0
        card.placeImage.clipsToBounds = true
        
        
        
        let pink = UIColor(red: 239/255, green: 71/255, blue: 111/255, alpha: 1)
        let green = UIColor(red: 97/255, green: 231/255, blue: 134/255, alpha: 1)
        let yellow = UIColor(red: 255/255, green: 200/255, blue: 23/255, alpha: 1)
        
        if card.crowdLabel.text == "CURRENTLY VERY CROWDED" {
            card.crowdLabel.textColor = pink
            card.crowdDot.backgroundColor = pink
        }
        if card.crowdLabel.text == "CURRENTLY NOT CROWDED" {
            card.crowdLabel.textColor = green
            card.crowdDot.backgroundColor = green
        }
        if card.crowdLabel.text == "CURRENTLY MILDLY CROWDED" {
            card.crowdLabel.textColor = yellow
            card.crowdDot.backgroundColor = yellow
        }
        
        
        card.addressLabel.font = UIFont(name: "Avenir-Medium", size: 12.0)
        card.placeLabel.font = UIFont(name: "Montserrat", size: 14.0)
        
        card.contentView.backgroundColor = UIColor(red: 247/255.0, green: 247/255.0, blue: 247/255.0, alpha: 1.0)
        
        card.backgroundCardView.layer.cornerRadius = 12.0
        card.backgroundCardView.layer.masksToBounds = false
        
        card.backgroundCardView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        
        card.backgroundCardView.layer.shadowOffset = CGSize(width: 0, height: 0)
        card.backgroundCardView.layer.shadowOpacity = 0.8
        

        
        return card
    }
    

        
    
        
        
    
    


    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
