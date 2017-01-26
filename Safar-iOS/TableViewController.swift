//
//  ViewController.swift
//  PlanningSafar
//
//  Created by Raha Ghassemi on 12/3/16.
//  Copyright © 2016 Newschool. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
//    @IBOutlet var navButton: UIButton!
    
    @IBOutlet weak var navButton2: UIButton!
    let data = Data()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.rowHeight = 90.0
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        
        let longpress = UILongPressGestureRecognizer(target: self, action: #selector(TableViewController.longPressGestureRecognized(_:)))
        tableView.addGestureRecognizer(longpress)
        
        navButton2.setImage(UIImage(named:"dropdown"), for: UIControlState.normal)
        navButton2.imageEdgeInsets = UIEdgeInsets(top: 8,left: 125,bottom: 6,right: 8)
        navButton2.titleEdgeInsets = UIEdgeInsets(top: 0,left: -10,bottom: 0,right: 14)
        navButton2.setTitle("New York", for: UIControlState.normal)
        navButton2.tintColor = UIColor(red: 77/255, green: 51/255, blue: 215/255, alpha: 1.0)
     
        

    }

    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            data.places.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return data.places.count
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
                swap(&data.places[indexPath!.row], &data.places[Path.initialIndexPath!.row])
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
   
        let entry = data.places[indexPath.row]
        
    
        cell.crowdDot.layer.cornerRadius = 5.0
        
        cell.tagImage.image = UIImage(named: entry.Tag)
        cell.addressLabel.text = entry.Address
        cell.placeLabel.text = entry.Location
        cell.crowdLabel.text = entry.Crowd.uppercased()
        
        let pink = UIColor(red: 239/255, green: 71/255, blue: 111/255, alpha: 1)
        let green = UIColor(red: 97/255, green: 231/255, blue: 134/255, alpha: 1)
        let yellow = UIColor(red: 255/255, green: 200/255, blue: 23/255, alpha: 1)
        
        if cell.crowdLabel.text == "CURRENTLY VERY CROWDED" {
            cell.crowdLabel.textColor = pink
            cell.crowdDot.backgroundColor = pink
        }
        if cell.crowdLabel.text == "CURRENTLY NOT CROWDED" {
            cell.crowdLabel.textColor = green
            cell.crowdDot.backgroundColor = green
        }
        if cell.crowdLabel.text == "CURRENTLY MILDLY CROWDED" {
            cell.crowdLabel.textColor = yellow
            cell.crowdDot.backgroundColor = yellow
        }
     
     
       
        
        cell.addressLabel.font = UIFont(name: "Avenir", size: 14.0)
        cell.placeLabel.font = UIFont(name: "Montserrat", size: 16.0)
        
        
        return cell
    }
    
    
        
        
        
        
        
        
        
    
        
        
        
        
        
        
        
        
        
        
        
        
    }




