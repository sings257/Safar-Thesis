//
//  CardViewController.swift
//  My_Mapbox
//
//  Created by Shikha Singh on 12/4/16.
//  Copyright © 2016 Shikha Singh. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


struct foodStruct{
    let name : String!
    let address : String!
    let category : String!
    let image : String!
    let number2 : String!
    let about : String!
    let lat : String!
    let long : String!
    

}

struct shopStruct{
    let name : String!
    let address : String!
    let category : String!
    let image : String!
    let number2 : String!
    let about : String!
    let lat : String!
    let long : String!
    
    
}

struct greenStruct{
    let name : String!
    let address : String!
    let category : String!
    let image : String!
    let number2 : String!
    let about : String!
    let lat : String!
    let long : String!

    
    
}

struct cultureStruct{
    let name : String!
    let address : String!
    let category : String!
    let image : String!
    let number2 : String!
    let about : String!
    let lat : String!
    let long : String!

    
    
}

var newStruct = [barsStruct]()

extension CardViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        
        if  collectionView.tag == 0 {
            
            return greenSpaces.count
            
        } else if collectionView.tag == 1 {
            
            return food.count
            
        } else if collectionView.tag == 2 {
            
            return culture.count
            
        } else {
            
            return shop.count
            
        }
        
        
    }
    
    func collectionView(collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let pageWidth:Float = 300
        
        let currentOffSet:Float = Float(scrollView.contentOffset.x)
        
        print(currentOffSet)
        let targetOffSet:Float = Float(targetContentOffset.pointee.x)
        
        print(targetOffSet)
        var newTargetOffset:Float = 0
        
        if(targetOffSet > currentOffSet){
            newTargetOffset = ceilf(currentOffSet / pageWidth) * pageWidth
        }else{
            newTargetOffset = floorf(currentOffSet / pageWidth) * pageWidth
        }
        
        if(newTargetOffset < 0){
            newTargetOffset = 0;
        }else if (newTargetOffset > Float(scrollView.contentSize.width)){
            newTargetOffset = Float(scrollView.contentSize.width)
        }
        
        targetContentOffset.pointee.x = CGFloat(currentOffSet)
        scrollView.setContentOffset(CGPoint(x: CGFloat(newTargetOffset), y: 0), animated: true)
        
    }
    
    
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CardCollectionViewCell
        
        
        
        
        if  collectionView.tag == 0 {
            
            let number = greenSpaces[indexPath.item].number2
            
            cell.imageName = greenSpaces[indexPath.item].image
            let address = greenSpaces[indexPath.item].address
//            let latitude = NumberFormatter().number(from: greenSpaces[indexPath.item].lat)?.doubleValue
//            let longitude = NumberFormatter().number(from: greenSpaces[indexPath.item].long)?.doubleValue
            
            cell.numLabel = number
            cell.addLabel = address
            cell.latPlace = greenSpaces[indexPath.item].lat
            cell.longPlace = greenSpaces[indexPath.item].long

            cell.aboutPlace = greenSpaces[indexPath.item].about
            cell.nameLabel.text = greenSpaces[indexPath.item].name
            cell.typeLabel.text = greenSpaces[indexPath.item].category
            cell.imageView.image = UIImage(named: cell.imageName)
            
        } else if collectionView.tag == 1 {
            
            let number = food[indexPath.item].number2
            let address = food[indexPath.item].address
            cell.imageName = food[indexPath.item].image
//            let latitude = NumberFormatter().number(from: food[indexPath.item].lat)?.doubleValue
//            let longitude = NumberFormatter().number(from: food[indexPath.item].long)?.doubleValue
            
            cell.numLabel = number
            cell.addLabel = address
            cell.latPlace = food[indexPath.item].lat
            cell.longPlace = food[indexPath.item].long
            
            cell.aboutPlace = food[indexPath.item].about
            cell.nameLabel.text = food[indexPath.item].name
            cell.typeLabel.text = food[indexPath.item].category
            cell.imageView.image = UIImage(named: cell.imageName)
            

            
        } else if collectionView.tag == 2 {
            
            let number = culture[indexPath.item].number2
            let address = culture[indexPath.item].address
//            let latitude = NumberFormatter().number(from: culture[indexPath.item].lat)?.doubleValue
//            let longitude = NumberFormatter().number(from: culture[indexPath.item].long)?.doubleValue
            cell.imageName = culture[indexPath.item].image
            
            cell.numLabel = number
            cell.addLabel = address
            cell.latPlace = culture[indexPath.item].lat
            cell.longPlace = culture[indexPath.item].long

            cell.aboutPlace = culture[indexPath.item].about
            cell.nameLabel.text = culture[indexPath.item].name
            cell.typeLabel.text = culture[indexPath.item].category
            cell.imageView.image = UIImage(named: cell.imageName)
            
            
            
        } else if collectionView.tag == 3 {
            
            let number = shop[indexPath.item].number2
            let address = shop[indexPath.item].address
//            let latitude = NumberFormatter().number(from: shop[indexPath.item].lat)?.doubleValue
//            let longitude = NumberFormatter().number(from: shop[indexPath.item].long)?.doubleValue
            cell.imageName = shop[indexPath.item].image
            
            cell.numLabel = number
            cell.addLabel = address
            cell.latPlace = shop[indexPath.item].lat
            cell.longPlace = shop[indexPath.item].long

            cell.aboutPlace = shop[indexPath.item].about
            cell.nameLabel.text = shop[indexPath.item].name
            cell.typeLabel.text = shop[indexPath.item].category
            cell.imageView.image = UIImage(named: cell.imageName)
            
            
        }
        
        
        
        cell.backgroundColor = model[collectionView.tag][indexPath.item]
        
        
        
        
        
        cell.layer.cornerRadius = 6.0
        cell.clipsToBounds = true
        
        cell.shadowView.layer.masksToBounds = false
        cell.shadowView.layer.cornerRadius = 6.0
        cell.imageView.layer.masksToBounds = true
        cell.imageView.layer.cornerRadius = 6.0
        cell.shadowView.layer.shadowColor = UIColor.black.withAlphaComponent(0.2).cgColor
        cell.shadowView.layer.shadowOffset = CGSize.init(width: 0, height: 0)
        cell.shadowView.layer.shadowOpacity = 0.8
        
        
        
        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //        let indexPathVal = collectionView.indexPathsForSelectedItems!.first
        let currentCell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
        valueToPass = currentCell.nameLabel.text
        imageToPass = currentCell.imageView.image
        numToPass = currentCell.numLabel
        aboutToPass = currentCell.aboutPlace
        addToPass = currentCell.addLabel
        latToPass = currentCell.latPlace
        longToPass = currentCell.longPlace
        imageNameToPass = currentCell.imageName

        
//        UIImage(named: imageToPass) = currentCell.imageView.image
        performSegue(withIdentifier: "seg3", sender: self)
        
        print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
    }
}


class CardViewController: UITableViewController {
    
    var valueToPass:String!
    var imageToPass:UIImage!
    var numToPass: String!
    var aboutToPass : String!
    var addToPass : String!
    var latToPass : String!
    var longToPass : String!
    var imageNameToPass : String!
    
    var food = [foodStruct]()
    var shop = [shopStruct]()
    var greenSpaces = [greenStruct]()
    var culture = [cultureStruct]()
    var types = ["Green Spaces", "Food", "Culture", "Shops"]
    let model = generateRandomData()
    var storedOffsets = [Int: CGFloat]()
    var toggleState = 2
    @IBAction func add(_ sender: Any) {
        
        
        if let button = sender as? UIButton {
            
            
            if toggleState == 1 {
                (sender as AnyObject).setImage(UIImage(named: "add-small"), for: .normal)
                toggleState = 2
                
                
                
            } else if toggleState == 2 {
                toggleState = 1
            if let superview = button.superview {
                (sender as AnyObject).setImage(UIImage(named: "added_button"), for: .normal)
                if let cell = superview.superview as? CardCollectionViewCell {

                    newStruct.append(barsStruct(name: cell.nameLabel.text, address: cell.addLabel, image: cell.imageName, number2: cell.numLabel, about: cell.aboutPlace, lat: cell.latPlace, long: cell.latPlace))
                }
            }
            }
        }
        
        
        print(newStruct)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for searchButton in (self.navigationController?.navigationBar.subviews)!
        {
            searchButton.removeFromSuperview()
        }
        
        let ref = FIRDatabase.database().reference()
        
        
        
        
        
        ref.child("Food").queryOrderedByKey().observe(.childAdded, with: { snapshot in
            
            let value = snapshot.value as? NSDictionary
            
            let name = value?["name"] as? String ?? ""
            let address = value?["address"] as? String ?? ""
            let category = value?["category"] as? String ?? ""
            let image = value?["image"] as? String ?? ""
            let number2 = value?["contact"] as? String ?? ""
            let about = value?["about"] as? String ?? ""
            let latitude = value?["latitude"] as? String ?? ""
            let longitude = value?["longitude"] as? String ?? ""



            
            
            
            
            self.food.insert(foodStruct(name: name, address: address, category: category, image : image, number2 : number2, about : about, lat : latitude, long : longitude), at : 0)
            self.tableView.reloadData()
            
        })
        
        
        ref.child("Shop").queryOrderedByKey().observe(.childAdded, with: { snapshot in
            
            let value = snapshot.value as? NSDictionary
            
            let name = value?["name"] as? String ?? ""
            let address = value?["address"] as? String ?? ""
            let category = value?["category"] as? String ?? ""
            let image = value?["image"] as? String ?? ""
            let number2 = value?["contact"] as? String ?? ""
            let about = value?["about"] as? String ?? ""
            let latitude = value?["latitude"] as? String ?? ""
            let longitude = value?["longitude"] as? String ?? ""


            
            
            self.shop.insert(shopStruct(name: name, address: address, category: category, image : image, number2 : number2, about : about, lat : latitude, long : longitude), at : 0)
            self.tableView.reloadData()
            
            //            print(snapshot.value)
        })
        
        ref.child("GreenSpaces").queryOrderedByKey().observe(.childAdded, with: { snapshot in
            
            let value = snapshot.value as? NSDictionary
            
            let name = value?["name"] as? String ?? ""
            let address = value?["address"] as? String ?? ""
            let category = value?["category"] as? String ?? ""
            let image = value?["image"] as? String ?? ""
            let number2 = value?["contact"] as? String ?? ""
            let about = value?["about"] as? String ?? ""
            let latitude = value?["latitude"] as? String ?? ""
            let longitude = value?["longitude"] as? String ?? ""


            
            
            self.greenSpaces.insert(greenStruct(name: name, address: address, category: category, image : image, number2 : number2, about : about, lat : latitude, long : longitude), at : 0)
            self.tableView.reloadData()
            
            
        })
        
        ref.child("Culture").queryOrderedByKey().observe(.childAdded, with: { snapshot in
            
            let value = snapshot.value as? NSDictionary
            
            let name = value?["name"] as? String ?? ""
            let address = value?["address"] as? String ?? ""
            let category = value?["category"] as? String ?? ""
            let image = value?["image"] as? String ?? ""
            let number2 = value?["contact"] as? String ?? ""
            let about = value?["about"] as? String ?? ""
            let latitude = value?["latitude"] as? String ?? ""
            let longitude = value?["longitude"] as? String ?? ""


            
            
            self.culture.insert(cultureStruct(name: name, address: address, category: category, image : image, number2 : number2, about : about, lat : latitude, long : longitude), at : 0)
            self.tableView.reloadData()
            
            
        })
        
        
        
        
        
        
        let image = UIImage(named: "back_arrow")
        
        let backButton = UIBarButtonItem.init(title: " ", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.back(sender:)))
        backButton.image = image
        UIBarButtonItem.appearance().setBackButtonBackgroundImage(image, for: .normal, barMetrics: .default)
        
        self.navigationItem.setLeftBarButton(backButton, animated: true)
        createNewButton.removeFromSuperview()
        self.navigationController!.navigationBar.frame = CGRect(x:0, y:0, width: self.view.frame.size.width, height: 60.0);
        
        
    }
    
    func back(sender: UIBarButtonItem) {
        
        self.performSegue(withIdentifier: "addseg3", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CardTableViewCell
        
        cell.typeLabel.text = types[indexPath.row].uppercased()
        
        
        
        
        
        
        
        
        
        return cell
        
        
    }
    
    
    
    
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let tableViewCell = cell as? CardTableViewCell else { return }
        
        
        
        
        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
        tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
        
        
        
        print(types[indexPath.row])
        
        
        
        
    }
    
    
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        guard let tableViewCell = cell as? CardTableViewCell else { return }
        
        storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //
        if segue.identifier == "seg3" {
            let detailVC: DetailViewController = segue.destination as! DetailViewController
            detailVC.placeSelected = valueToPass
            detailVC.imageSelected = imageToPass
            detailVC.numSelected = numToPass
            detailVC.aboutSelected = aboutToPass
            detailVC.addressSelected = addToPass
            detailVC.latSelected = latToPass
            detailVC.longSelected = longToPass
            detailVC.imageNameSelected = imageNameToPass
        
            
            print("hey this works too")
        }
       
            // use indexPath
            
            if segue.identifier == "seg2" {
                let viewAllVC: ViewAllTableViewController = segue.destination as! ViewAllTableViewController
                print("hey, this \(viewAllVC) works")
                
            }
        
    }
    
}


