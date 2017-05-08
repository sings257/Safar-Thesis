//
//  DetailViewController.swift
//  My_Mapbox
//
//  Created by Raha Ghassemi on 2/16/17.
//  Copyright © 2017 Raha Ghassemi. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import ReadMoreTextView
import Mapbox
import CoreLocation
import MapKit

//import MPParallaxView



class DetailViewController: UIViewController, UIScrollViewDelegate, UITextViewDelegate, MGLMapViewDelegate, CLLocationManagerDelegate{
    

    
    
    var newStruct = [barsStruct]()
    
    var placeSelected:String!
    var numSelected : String!
    var imageSelected:UIImage!
    var aboutSelected : String!
    var addressSelected : String!
    var latSelected : String!
    var longSelected : String!
    var imageNameSelected : String!
    
    

    var mapFrame : CGRect = CGRect(x: 0, y: 553, width: 375, height: 165)
    var greyFrame : CGRect = CGRect(x: 0, y: 718, width: 375, height: 392)
    var textFrame : CGRect = CGRect(x: 22, y: 732, width: 330, height: 84)
    var numFrame: CGRect = CGRect(x: -1, y: 1110, width: 377, height: 48)
    var numFramText: CGRect = CGRect(x: 22, y: 1114, width: 375, height: 44)
    var popView : CGRect = CGRect(x: 0, y: 1160, width: 375, height: 281)
    
    let locationManager = CLLocationManager()

    

   
    
   
    

    
    
    @IBOutlet var scrollView: UIScrollView!
    var toggleState = 2
    
    
    @IBAction func addButton(_ sender: Any) {
        if toggleState == 1 {
            (sender as AnyObject).setImage(UIImage(named: "add-2"), for: .normal)
            toggleState = 2
            
            
            
        } else if toggleState == 2 {
            (sender as AnyObject).setImage(UIImage(named: "added"), for: .normal)
            toggleState = 1
//            newStruct.append(barsStruct(name: placeSelected!, address: addressSelected!, image: imageNameSelected!, number2: numSelected!, about: aboutSelected!))
//            let lats = NumberFormatter().number(from: latSelected)?.doubleValue
//            let longs = NumberFormatter().number(from: longSelected)?.doubleValue
            newStruct.append(barsStruct(name: placeSelected!, address: addressSelected!, image: imageNameSelected!, number2: numSelected!, about: aboutSelected!, lat: latSelected, long: longSelected))
            
            print(newStruct)
            
        }
        
        
    }
    
    @IBOutlet var addressView: UIView!
    
    @IBOutlet weak var imageViewMain: UIImageView!
    
    @IBOutlet weak var aboutPlaceText: ReadMoreTextView!
    var placeHolderText : UILabel!
    
    @IBOutlet var nameLabel: UILabel!
    let label1 = UILabel(frame: CGRect(x: 234, y: 838 , width: 38, height: 38))
    let label1View = UIView(frame: CGRect(x: 225, y: 840 , width: 34, height: 34))
    let label2 = UILabel(frame: CGRect(x: 198, y: 890 , width: 38, height: 38))
    let label2View = UIView(frame: CGRect(x: 190, y: 892 , width: 34, height: 34))
    let label3 = UILabel(frame: CGRect(x: 242, y: 942 , width: 38, height: 38))
    let label3View = UIView(frame: CGRect(x: 230, y: 944 , width: 34, height: 34))
    let label4 = UILabel(frame: CGRect(x: 202, y: 994 , width: 38, height: 38))
    let label4View = UIView(frame: CGRect(x: 190, y: 996 , width: 34, height: 34))
    let label5 = UILabel(frame: CGRect(x: 198, y: 1046 , width: 38, height: 38))
    let label5View = UIView(frame: CGRect(x: 190, y: 1048 , width: 34, height: 34))
    
    @IBOutlet weak var mapButton: UIButton!
    
    @IBAction func mapButton(_ sender: Any) {
        
        
        let alert = UIAlertController(title: "Selection", message : "Select Navigation App", preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: "Apple Maps", style: UIAlertActionStyle.default ) { action -> Void in self.openMapForPlace()})
        alert.addAction(UIAlertAction(title: "Google Maps", style: UIAlertActionStyle.default ) { action -> Void in self.openGoogleForPlace()})
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.destructive , handler : nil))


        present(alert, animated: true, completion: nil)

 
        
    }
    
    
    
    override func viewDidLoad() {
        
        
        nameLabel.text = placeSelected
        imageViewMain.image = imageSelected
        
        aboutPlaceText.text = aboutSelected
        
        
        
        aboutPlaceText.shouldTrim = true
        aboutPlaceText.maximumNumberOfLines = 4
        
        
        mapButton.setTitle(addressSelected, for: UIControlState.normal)
        
        
        aboutPlaceText.attributedReadMoreText = NSAttributedString(string: "... Read more")
        
        aboutPlaceText.attributedReadLessText = NSAttributedString(string: " Read less")
        
        if aboutPlaceText.attributedReadLessText == NSAttributedString(string: " Read less") {
            
            aboutPlaceText.frame = CGRect(x: 22, y: 390, width: 330, height: 200)
//            addressView.frame.offsetBy(dx: 0, dy: 20)
        
        } else {
            aboutPlaceText.frame = CGRect(x: 22, y: 390, width: 330, height: 100)
//            addressView.frame = CGRect(x: -5, y: 505, width: 387, height: 48)
        }
      
        
        super.viewDidLoad()
        
        let image = UIImage(named: "back_arrow")
        
        
        
        let textView = UITextView(frame : numFramText)
        let contactView = UIView (frame : numFrame)
        let greyView = UIView (frame : greyFrame)
        let text1 = UITextView (frame : textFrame)
        let popularTime = UIImageView (frame : popView)
        

        let styleURL = NSURL(string: "mapbox://styles/shhikhasingh/ciw6oc3wo00182lnn49d3k0lw")
        let mapView = MGLMapView(frame: mapFrame, styleURL: styleURL as URL?)
        
        let lats = NumberFormatter().number(from: latSelected)?.doubleValue
        let longs = NumberFormatter().number(from: longSelected)?.doubleValue
    
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        mapView.setCenter(CLLocationCoordinate2D(latitude: lats!, longitude: longs!), zoomLevel:14, animated: false)
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        
        mapView.delegate = self
        
        
        
        let location = MGLPointAnnotation()
        location.coordinate = CLLocationCoordinate2D(latitude: lats!, longitude: longs!)
        location.title = placeSelected
        
        
        
        
        
        
        mapView.addAnnotation(location)

        textView.text = numSelected
        
        
        textView.delegate = self
        
        textView.isUserInteractionEnabled = true;
        textView.isSelectable = true
        textView.isEditable = false
        textView.isScrollEnabled = false
        textView.allowsEditingTextAttributes = false
      
        
        textView.dataDetectorTypes = UIDataDetectorTypes.all

        
        
        
        let button1 = UIButton(frame: CGRect(x: 24, y: 838 , width: 239, height: 38))
        let button2 = UIButton(frame: CGRect(x: 24, y: 890 , width: 205, height: 38))
        let button3 = UIButton(frame: CGRect(x: 24, y: 942 , width: 245, height: 38))
        let button4 = UIButton(frame: CGRect(x: 24, y: 994 , width: 205, height: 38))
        let button5 = UIButton(frame: CGRect(x: 24, y: 1046 , width: 205, height: 38))
        
        
        
        let backButton = UIBarButtonItem.init(title: " ", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.back(sender:)))
        backButton.image = image
        UIBarButtonItem.appearance().setBackButtonBackgroundImage(image, for: .normal, barMetrics: .default)
        
        self.navigationItem.setLeftBarButton(backButton, animated: true)
        scrollView.contentSize = CGSize(width: 375, height: 1370)
        
        
        
        greyView.backgroundColor = UIColor(red: 247/255, green: 247/255, blue: 247/255, alpha: 1.0)
        
        
        textView.font  = UIFont(name: "Avenir-Medium", size: 16)
        textView.textColor = UIColor(red: 122/255, green: 122/255, blue: 122/255, alpha: 1.0)
        
        
        
        imageViewMain.layer.cornerRadius = 8.0
        
        addressView.layer.borderColor = UIColor.lightGray.cgColor
        addressView.layer.borderWidth = 0.5
        
        contactView.layer.borderColor = UIColor.lightGray.cgColor
        contactView.backgroundColor = UIColor.clear
        contactView.layer.borderWidth = 0.5
        
        text1.text = "\(placeSelected!) has been endorsed for the following sustainability practices. Help create the first database of sustainable places by endorsing them for practices you know they follow."
        
        text1.font = UIFont(name: "Avenir-Medium", size: 14)
        text1.textColor = UIColor.black
        text1.backgroundColor = UIColor.clear
        text1.isEditable = false
        text1.isSelectable = false
        text1.isUserInteractionEnabled = false
        
        
        
        
        
        label1.text = "40"
        label2.text = "12"
        label3.text = "2"
        label4.text = "5"
        label5.text = "18"
        label1.font = UIFont(name: "Avenir-Black", size: 14)
        label1.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        label2.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        label3.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        label4.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        label5.font = UIFont(name: "Avenir-Black", size: 14)
        label5.textColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1.0)
        label2.font = UIFont(name: "Avenir-Black", size: 14)
     
        label3.font = UIFont(name: "Avenir-Black", size: 14)
      
        label4.font = UIFont(name: "Avenir-Black", size: 14)
        
        label1View.backgroundColor = UIColor(red: 77/255, green: 51/255, blue: 215/255, alpha: 1.0)
        label1View.layer.cornerRadius = 17.0
        label2View.backgroundColor = UIColor(red: 77/255, green: 51/255, blue: 215/255, alpha: 1.0)
        label2View.layer.cornerRadius = 17.0
        label3View.backgroundColor = UIColor(red: 77/255, green: 51/255, blue: 215/255, alpha: 1.0)
        label3View.layer.cornerRadius = 17.0
        label4View.backgroundColor = UIColor(red: 77/255, green: 51/255, blue: 215/255, alpha: 1.0)
        label4View.layer.cornerRadius = 17.0
        label5View.backgroundColor = UIColor(red: 77/255, green: 51/255, blue: 215/255, alpha: 1.0)
        label5View.layer.cornerRadius = 17.0
        
        button1.backgroundColor = UIColor.white
        button1.imageEdgeInsets = UIEdgeInsets(top: 10,left: -55 ,bottom: 10,right: 0)
        button1.titleEdgeInsets = UIEdgeInsets(top: 10,left: -15,bottom: 10,right: 0)
        button2.imageEdgeInsets = UIEdgeInsets(top: 10,left: -56 ,bottom: 10,right: 0)
        button2.titleEdgeInsets = UIEdgeInsets(top: 10,left: -16,bottom: 10,right: 0)
        button3.imageEdgeInsets = UIEdgeInsets(top: 10,left: -56 ,bottom: 10,right: 0)
        button3.titleEdgeInsets = UIEdgeInsets(top: 10,left: -16,bottom: 10,right: 0)
        button4.imageEdgeInsets = UIEdgeInsets(top: 10,left: -55 ,bottom: 10,right: 0)
        button4.titleEdgeInsets = UIEdgeInsets(top: 10,left: -15,bottom: 10,right: 0)
        button5.backgroundColor = UIColor.white
        button5.imageEdgeInsets = UIEdgeInsets(top: 10,left: -55 ,bottom: 10,right: 0)
        button5.titleEdgeInsets = UIEdgeInsets(top: 10,left: -15,bottom: 10,right: 0)

        button1.setImage(UIImage(named:"AddPlace"), for: UIControlState.normal)
        button1.layer.cornerRadius = 20.0
        button1.layer.shadowColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        button1.layer.shadowOffset = CGSize.init(width: 0, height: 5)
        button1.layer.shadowOpacity = 0.3
        button1.setTitle("Locally sourced food", for: UIControlState.normal)
        button1.setTitleColor(UIColor(red: 122/255, green: 122/255, blue: 122/255, alpha: 1.0), for: .normal)
        button1.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 14)
        
        button2.backgroundColor = UIColor.white
        button2.setImage(UIImage(named:"AddPlace"), for: UIControlState.normal)
        button2.layer.cornerRadius = 20.0
        button2.layer.shadowColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        button2.layer.shadowOffset = CGSize.init(width: 0, height: 5)
        button2.layer.shadowOpacity = 0.3
        button2.setTitle("Seasonal menu", for: UIControlState.normal)
        button2.setTitleColor(UIColor(red: 122/255, green: 122/255, blue: 122/255, alpha: 1.0), for: .normal)
        button2.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 14)
        
        
        
        button3.backgroundColor = UIColor.white
        button3.setImage(UIImage(named:"AddPlace"), for: UIControlState.normal)
        button3.layer.cornerRadius = 20.0
        button3.layer.shadowColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        button3.layer.shadowOffset = CGSize.init(width: 0, height: 5)
        button3.layer.shadowOpacity = 0.3
        button3.setTitle("Sustainable suppliers", for: UIControlState.normal)
        button3.setTitleColor(UIColor(red: 122/255, green: 122/255, blue: 122/255, alpha: 1.0), for: .normal)
        button3.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 14)
        
        button4.backgroundColor = UIColor.white
        button4.setImage(UIImage(named:"AddPlace"), for: UIControlState.normal)
        button4.layer.cornerRadius = 20.0
        button4.layer.shadowColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        button4.layer.shadowOffset = CGSize.init(width: 0, height: 5)
        button4.layer.shadowOpacity = 0.3
        button4.setTitle("Energy efficient", for: UIControlState.normal)
        button4.setTitleColor(UIColor(red: 122/255, green: 122/255, blue: 122/255, alpha: 1.0), for: .normal)
        button4.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 14)
        
        button5.setImage(UIImage(named:"AddPlace"), for: UIControlState.normal)
        button5.layer.cornerRadius = 20.0
        button5.layer.shadowColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
        button5.layer.shadowOffset = CGSize.init(width: 0, height: 5)
        button5.layer.shadowOpacity = 0.3
        button5.setTitle("Waste reducing", for: UIControlState.normal)
        button5.setTitleColor(UIColor(red: 122/255, green: 122/255, blue: 122/255, alpha: 1.0), for: .normal)
        button5.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 14)
        
        popularTime.image = UIImage(named:"popular")
        
        
        scrollView.addSubview(mapView)
        scrollView.addSubview(textView)
        scrollView.addSubview(contactView)
        scrollView.addSubview(greyView)
        scrollView.addSubview(text1)
        scrollView.addSubview(button1)
        scrollView.addSubview(button2)
        scrollView.addSubview(button3)
        scrollView.addSubview(button4)
        scrollView.addSubview(button5)
        scrollView.addSubview(popularTime)
        scrollView.addSubview(addressView)
        scrollView.addSubview(label1View)
        scrollView.addSubview(label2View)
        scrollView.addSubview(label3View)
        scrollView.addSubview(label4View)
        scrollView.addSubview(label5View)
        scrollView.addSubview(label1)
        scrollView.addSubview(label2)
        scrollView.addSubview(label3)
        scrollView.addSubview(label4)
        scrollView.addSubview(label5)
        
        button1.addTarget(self, action: #selector(self.addEndorsement1(sender:)), for: UIControlEvents.touchUpInside)
        button2.addTarget(self, action: #selector(self.addEndorsement2(sender:)), for: UIControlEvents.touchUpInside)
        button3.addTarget(self, action: #selector(self.addEndorsement3(sender:)), for: UIControlEvents.touchUpInside)
        button4.addTarget(self, action: #selector(self.addEndorsement4(sender:)), for: UIControlEvents.touchUpInside)
        button5.addTarget(self, action: #selector(self.addEndorsement5(sender:)), for: UIControlEvents.touchUpInside)
        scrollView.delegate = self

        
    }
    
    
    

    
    
    func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange, interaction: UITextItemInteraction) -> Bool {
       
        return true
    }
    
    func addEndorsement1(sender: AnyObject) -> () {
        var num = 0;
        num = Int(label1.text!)!
        self.label1.text = String(num + 1)
    
    }
    func addEndorsement2(sender: AnyObject) -> () {
        var num = 0;
        num = Int(label2.text!)!
        self.label2.text = String(num + 1)
        
    }
    func addEndorsement3(sender: AnyObject) -> () {
        var num = 0;
        num = Int(label3.text!)!
        self.label3.text = String(num + 1)
        
    }
    func addEndorsement4(sender: AnyObject) -> () {
        var num = 0;
        num = Int(label4.text!)!
        self.label4.text = String(num + 1)
        
    }
    func addEndorsement5(sender: AnyObject) -> () {
        var num = 0;
        num = Int(label5.text!)!
        self.label5.text = String(num + 1)
        
    }
    
    
    func mapView(_ mapView: MGLMapView, imageFor annotation: MGLAnnotation) -> MGLAnnotationImage? {
        
        var annotationImage = mapView.dequeueReusableAnnotationImage(withIdentifier: "location")
        
        if annotationImage == nil {
            var image2 = UIImage(named: "marker")
            image2 = image2?.withAlignmentRectInsets(UIEdgeInsets(top: 0, left: 0, bottom: (image2?.size.height)!/2, right: 0))
            
            annotationImage = MGLAnnotationImage(image: image2!, reuseIdentifier: "location")
        }
        
        return annotationImage
    }
    
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        
        return true
        
    }

    func textViewShouldBeginEditing(_ textView: UITextView) -> Bool {
        return false
    }
    
    
    func action(sender:UIButton!) {
        print("Button Clicked")
    }
    
    
    
    

    
    func  locationManager(_ manager: CLLocationManager, didFailWithError error: Error)
    {
        print ("Errors:" + error.localizedDescription)
    }
    
    func openMapForPlace() {
        
        let currentLat = "40.7"
        let currentLong = "-74"
        
        let lats = NumberFormatter().number(from: latSelected)?.doubleValue
        let longs = NumberFormatter().number(from: longSelected)?.doubleValue
        
        let mapUrl = NSURL(string: "http://maps.apple.com/maps?saddr=\(currentLat),\(currentLong)&daddr=\(String(describing: lats!)),\(longs!)")! as URL
        UIApplication.shared.open(mapUrl, options: [:], completionHandler: nil)
    }
    
    func openGoogleForPlace() {

        let currentLat = "40.7"
        let currentLong = "-74"
        
        let lats = NumberFormatter().number(from: latSelected)?.doubleValue
        let longs = NumberFormatter().number(from: longSelected)?.doubleValue
        
        
        if (UIApplication.shared.canOpenURL(URL(string:"comgooglemaps://")!)) {
            
            let mapUrl = NSURL(string: "comgooglemapsurl://?saddr=\(currentLat),\(currentLong)&daddr=\(String(describing: lats!)),\(longs!)&mapmode=standard&views=&directionsmode=walking")! as URL
            
            UIApplication.shared.open(mapUrl, options: [:], completionHandler: nil)

            
            } else {
            print("Can't use comgooglemaps://");
        }


    }
    
    
    

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func back(sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: "addseg", sender: self)
//        _ = navigationController?.popViewController(animated: true)
    }
    
    
    

    
}






