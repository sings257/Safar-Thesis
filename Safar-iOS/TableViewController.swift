//
//  ViewController.swift
//  PlanningSafar
//
//  Created by Raha Ghassemi on 12/3/16.
//  Copyright © 2016 Newschool. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


struct barsStruct{
    let name : String!
    let address : String!
    let image : String!
    let number2 : String!
    let about : String!
    let lat : String!
    let long : String!
    
}

class TableViewController: UITableViewController {

//    let data = Data()
    var nameToPass:String!
    var imageToPass:UIImage!
    var numToPass: String!
    var aboutToPass : String!
    var addToPass : String!
    var latToPass : String!
    var longToPass : String!
    var imageNameToPass : String!
    var addedPlace:String!
    
    var bars = [barsStruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let ref = FIRDatabase.database().reference()
        
        
        ref.child("Food").queryOrderedByKey().observe(.childAdded, with: { snapshot in
            
            
            
            

            self.tableView.reloadData()
            
            
        })

        self.tableView.rowHeight = 90.0
       
            
            
        
     

        
        let longpress = UILongPressGestureRecognizer(target: self, action: #selector(TableViewController.longPressGestureRecognized(_:)))
        tableView.addGestureRecognizer(longpress)
        
        let image = UIImage(named: "back_arrow")
        
        
        
        let backButton = UIBarButtonItem.init(title: " ", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.back(sender:)))
        backButton.image = image
        UIBarButtonItem.appearance().setBackButtonBackgroundImage(image, for: .normal, barMetrics: .default)
        
        self.navigationItem.setLeftBarButton(backButton, animated: true)
        createNewButton.removeFromSuperview()
        

    }
    
    func back(sender: UIBarButtonItem) {
        
        _ = navigationController?.popViewController(animated: true)
    }

    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            bars.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return bars.count
    }
    
    
    
    func longPressGestureRecognized(_ gestureRecognizer: UIGestureRecognizer) {
        let longPress = gestureRecognizer as! UILongPressGestureRecognizer
        let state = longPress.state
        let locationInView = longPress.location(in: tableView)
        let indexPath = tableView.indexPathForRow(at: locationInView)
        
        
        
        
        
        struct My {
            
            static var cellSnapshot : UIView? = nil
            
        }
        struct Path {
            
            static var initialIndexPath : IndexPath? = nil
            
        }
        
        switch state {
        case UIGestureRecognizerState.began:
            if indexPath != nil {
                Path.initialIndexPath = indexPath
                let cell = tableView.cellForRow(at: indexPath!) as UITableViewCell!
                My.cellSnapshot  = snapshopOfCell(cell!)
                var center = cell?.center
                
                My.cellSnapshot!.center = center!
                
                My.cellSnapshot!.alpha = 0.0
                
                tableView.addSubview(My.cellSnapshot!)
                
                UIView.animate(withDuration: 0.25, animations: { () -> Void in
                    center?.y = locationInView.y
                    
                    My.cellSnapshot!.center = center!
                    
                    My.cellSnapshot!.transform = CGAffineTransform(scaleX: 1.05, y: 1.05)
                    
                    My.cellSnapshot!.alpha = 0.98
                    
                    cell?.alpha = 0.0
                    
                }, completion: { (finished) -> Void in
                    
                    if finished {
                        
                        cell?.isHidden = true
                        
                    }
                    
                })
                
            }
        case UIGestureRecognizerState.changed:
            var center = My.cellSnapshot!.center
            center.y = locationInView.y
            My.cellSnapshot!.center = center
            if ((indexPath != nil) && (indexPath != Path.initialIndexPath) && (indexPath?.row != 0)) {
                swap(&bars[indexPath!.row], &bars[Path.initialIndexPath!.row])
                tableView.moveRow(at: Path.initialIndexPath!, to: indexPath!)
                Path.initialIndexPath = indexPath
            }
        default:
            let cell = tableView.cellForRow(at: Path.initialIndexPath!) as UITableViewCell!
            cell?.isHidden = false
            cell?.alpha = 0.0
            UIView.animate(withDuration: 0.25, animations: { () -> Void in
                My.cellSnapshot!.center = (cell?.center)!
                My.cellSnapshot!.transform = CGAffineTransform.identity
                My.cellSnapshot!.alpha = 0.0
                cell?.alpha = 1.0
            }, completion: { (finished) -> Void in
                if finished {
                    Path.initialIndexPath = nil
                    My.cellSnapshot!.removeFromSuperview()
                    My.cellSnapshot = nil
                }
            })
            
        }
    }
    func snapshopOfCell(_ inputView: UIView) -> UIView {
        UIGraphicsBeginImageContextWithOptions(inputView.bounds.size, false, 0.0)
        inputView.layer.render(in: UIGraphicsGetCurrentContext()!)
        let image = UIGraphicsGetImageFromCurrentImageContext()! as UIImage
        UIGraphicsEndImageContext()
        let cellSnapshot : UIView = UIImageView(image: image)
        cellSnapshot.layer.masksToBounds = false
        cellSnapshot.layer.cornerRadius = 0.0
        cellSnapshot.layer.shadowOffset = CGSize(width: -5.0, height: 0.0)
        cellSnapshot.layer.shadowRadius = 5.0
        cellSnapshot.layer.shadowOpacity = 0.4
        return cellSnapshot
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
   
//        let entry = bars[indexPath.row]
        
    

        
        cell.numLabel = bars[indexPath.row].number2
        cell.aboutPlace = bars[indexPath.row].about
        cell.imageName = bars[indexPath.row].image
//        let latitude = NumberFormatter().number(from: bars[indexPath.item].lat)?.doubleValue
//        let longitude = NumberFormatter().number(from: bars[indexPath.item].long)?.doubleValue
        cell.placeLabel.text = bars[indexPath.row].name
        cell.addressLabel.text = bars[indexPath.row].address
        cell.tagImage?.image = UIImage(named: bars[indexPath.row].image)
        cell.tagImage?.layer.masksToBounds = true

        cell.tagImage?.layer.cornerRadius = 22.0
        cell.latPlace = bars[indexPath.item].lat
        cell.longPlace = bars[indexPath.item].long
        
        
       
        
        cell.addressLabel.font = UIFont(name: "Avenir", size: 14.0)
        cell.placeLabel.font = UIFont(name: "Montserrat", size: 16.0)
        
        
        return cell
    }
    

        
        
        
        
        
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //

        if segue.identifier == "segue2" {
            let detailVC: DetailViewController = segue.destination as! DetailViewController
            //                detailVC.placeSelected = String(indexPath.item)
            detailVC.placeSelected = nameToPass
            detailVC.imageSelected = imageToPass
            detailVC.numSelected = numToPass
            detailVC.aboutSelected = aboutToPass
            detailVC.addressSelected = addToPass
            detailVC.newStruct = self.bars
            detailVC.imageNameSelected = imageNameToPass
            detailVC.longSelected = longToPass
            detailVC.latSelected = latToPass
            
        }
        if segue.identifier == "addseg2" {
            //            let detailVC: CardViewController = segue.destination as! CardViewController
            //                detailVC.placeSelected = String(indexPath.item)
            
            newStruct = self.bars
            
            
            
        }

        
    }
    
    
    
        
        
        
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //        let indexPathVal = tableView.indexPathForSelectedRow!
        let currentCell = tableView.cellForRow(at: indexPath) as! TableViewCell
        nameToPass = currentCell.placeLabel?.text
        imageToPass = currentCell.tagImage?.image
        numToPass = currentCell.numLabel
        aboutToPass = currentCell.aboutPlace
        addToPass = currentCell.addressLabel?.text
        imageNameToPass = currentCell.imageName
        latToPass = currentCell.latPlace
        longToPass = currentCell.longPlace
        
        performSegue(withIdentifier: "segue2", sender: self)
        
    }
        
    @IBAction func addseg(_ segue:UIStoryboardSegue) {
        if segue.identifier == "addseg" {
            let detailVC: DetailViewController = segue.source as! DetailViewController
            self.bars = detailVC.newStruct
            self.tableView.reloadData()
        }
    }
    @IBAction func addseg3(_ segue:UIStoryboardSegue) {
        if segue.identifier == "addseg3" {
            //            let detailVC: CardViewController = segue.source as! CardViewController
            self.bars = newStruct
            self.tableView.reloadData()
        }
    }
    
        
        
        
        
    }





