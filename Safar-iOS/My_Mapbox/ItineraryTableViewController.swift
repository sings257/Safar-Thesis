//
//  ItineraryTableViewController.swift
//  My_Mapbox
//
//  Created by Raha Ghassemi on 2/16/17.
//  Copyright © 2017 Raha Ghassemi. All rights reserved.
//

import UIKit

let createNewButton = UIButton()

class ItineraryTableViewController: UITableViewController {
    
    @IBOutlet weak var favoritesButton: UIButton!
    
    let table = TableViewController()
    var itineraries = [String]()
    var newItinerary: String = ""
    var favorites = "Favorites"
    let favoritesLabel = UILabel()
    let placeLabelFavorites = UILabel()
    let placeLabelFavorites2 = UILabel()
    @IBAction func cancel(_ segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func done(_ segue:UIStoryboardSegue) {
        let newVC = segue.source as! CreateNewItineraryViewController
        newItinerary = newVC.name
        
        itineraries.append(newItinerary)
        self.tableView.reloadData()
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        
        itineraries = []
        favoritesLabel.text = "Favorites"
        favoritesLabel.textColor = UIColor(red: 1.0, green: 0, blue: 141/255, alpha: 1.0)
        favoritesLabel.frame = CGRect(x: 24, y: 30, width: 120, height: 20)
        favoritesLabel.font = UIFont(name: "Montserrat", size: 17)
        placeLabelFavorites.text = "\(table.bars.count)"
        placeLabelFavorites.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1.0)
        placeLabelFavorites.frame = CGRect(x: 24, y: 53, width: 120, height: 20)
        placeLabelFavorites.font = UIFont(name: "Avenir-Heavy", size: 12)
        placeLabelFavorites2.text = "places"
        placeLabelFavorites2.textColor = UIColor(red: 74/255, green: 74/255, blue: 74/255, alpha: 1.0)
        placeLabelFavorites2.frame = CGRect(x: 44, y: 53, width: 120, height: 20)
        placeLabelFavorites2.font = UIFont(name: "Avenir-Medium", size: 12)
        favoritesButton.addSubview(favoritesLabel)
        favoritesButton.addSubview(placeLabelFavorites)
        favoritesButton.addSubview(placeLabelFavorites2)
        
        createNewButton.frame = CGRect(x: self.view.frame.width/2 - 130, y: self.view.frame.height - 110, width: 260, height: 40)
        
        self.tableView.rowHeight = 100.0
        
        createNewButton.setTitle("CREATE NEW ITINERARY", for: .normal)
        createNewButton.titleLabel?.textColor = UIColor.white
        createNewButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 14)
        createNewButton.layer.cornerRadius = 20.0
        createNewButton.layer.backgroundColor = UIColor(red: 77/255, green: 51/255, blue: 215/255, alpha: 1.0).cgColor
        createNewButton.layer.shadowColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        createNewButton.layer.shadowOffset = CGSize.init(width: 0, height: 10)
        createNewButton.layer.shadowOpacity = 0.2
        
        self.navigationController?.view.addSubview(createNewButton)
        
        createNewButton.addTarget(self, action: #selector(self.didTapAddButton(sender:)), for: UIControlEvents.touchUpInside)
        
    
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            itineraries.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.navigationController?.view.addSubview(createNewButton)
//        self.navigationController?.navigationBar.barTintColor = UIColor(red: 77/255, green: 228/255, blue: 196/255, alpha: 1.0)
    }
    
 
    




    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itineraries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! ItineraryTableViewCell
        cell.itineraryName!.text = itineraries[indexPath.row]
        cell.image1.image = UIImage(named: "dill")
        cell.infoLabel.text = "\(table.bars.count)"
        
        
        
        

        
        
        return cell
    }
    
    
    func didTapAddButton(sender: UIButton!) {
//        let indexPath = IndexPath(row: 0, section:0)
//        tableView.insertRows(at: [indexPath], with: .automatic)
        self.performSegue(withIdentifier: "segue4", sender: self)
        
    }
   




}
