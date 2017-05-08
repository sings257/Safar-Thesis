//
//  SeekViewController.swift
//  My_Mapbox
//
//  Created by Raha Ghassemi on 2/15/17.
//  Copyright © 2017 Shikha Singh. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

var searchButton : UIButton!

class SeekViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet var pageControl: UIPageControl!
    @IBOutlet var navButton2: UIButton!
    @IBOutlet var scrollView: UIScrollView!
    

    let ref = FIRDatabase.database().reference()
    var typedName : String!
    
    
    
 


    @IBOutlet var nowButton: UIButton!
    

    @IBOutlet var textView: UITextView!
//    let scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: 320, height: 300))
    var images:[UIImage] = [UIImage(named: "NBK")!, UIImage(named: "Rabbithole-Featured")!, UIImage(named: "bookthug")!, UIImage(named: "catbird")!]
    var frame: CGRect = CGRect(x: 0, y: 0, width: 0, height: 0)
//    var frameScroll: CGRect = CGRect(x: 0, y: 0, width: 375, height: 600)
    var frame2: CGRect = CGRect(x: 30, y: -110, width: 250, height: 100)
    var frame3: CGRect = CGRect(x: 0, y: 210, width: 300, height: 400)
    var frame4: CGRect = CGRect(x: 30, y: 80, width: 300, height: 80)
    var frame5: CGRect = CGRect(x: 78, y: 561, width: 220, height: 40)
    var frame6: CGRect = CGRect(x: 30, y: 180, width: 220, height: 40)
    var frame7: CGRect = CGRect(x: 80, y: 521, width: 80, height: 20)
    var searchFrame: CGRect = CGRect(x: 15, y: 62, width: 344, height: 40)
    
  
    
    var hashtags:[String] = ["#greenspaces     #food","#food     #leisure","#culture     #shop","#shop"]
    
    var names:[String] = ["NBK FARMS", "RABBITHOLE", "BOOKTHUG", "CATBIRD"]
    var titles:[String] = ["TODAY IN SUSTAINABILITY", "RECOMMENDED BRUNCH SPOT", "RECOMMENDED EVENT", "RECOMMENDED SHOP"]
    var descriptions:[String] = [ "North Brooklyn Farms reshapes unused land into public green spaces where people connect with nature and one another through agriculture and find access to sustainably-grown produce.", "Offering a sense of integrity to everything they do. The food is great, the pastries are home made and the bar is equally devised.", "Reading : Puddles of Myself Capture the full gamut of Puddles’ reach on culture and the human soul. Starts at 7.30pm", "Squeeze inside this tiny shop of sparkly things. Find all the everyday earrings you need, pretty cards and gifts, and tiny bottles of perfume, all sourced from local designers, and made with ethically sourced or recycled stones and gold."]
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configurePageControl()
//            let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: navigationController, action: nil)
        
        self.navigationController!.navigationBar.frame = CGRect(x:0, y:0, width: self.view.frame.size.width, height: 82.0);
        
//            navigationItem.leftBarButtonItem = backButton
        
            navButton2.setImage(UIImage(named:"dropdown"), for: UIControlState.normal)
            navButton2.imageEdgeInsets = UIEdgeInsets(top: -32,left: 130,bottom: 6,right: 8)
            navButton2.titleEdgeInsets = UIEdgeInsets(top: -40,left: -10,bottom: 0,right: 14)
            navButton2.setTitle("Williamsburg", for: UIControlState.normal)
            navButton2.tintColor = UIColor.black
        
        scrollView.delegate = self
        self.view.addSubview(scrollView)
        for index in 0..<4 {
            
            frame.origin.x = self.scrollView.frame.size.width * CGFloat(index)
            frame.size = self.scrollView.frame.size
            frame2.origin.x = self.scrollView.frame.size.width * CGFloat(index) + 30
            frame2.size = self.scrollView.frame.size
            frame3.origin.x = self.scrollView.frame.size.width * CGFloat(index) + 30
            frame3.size = self.frame3.size
            frame4.origin.x = self.scrollView.frame.size.width * CGFloat(index) + 30
            frame4.size = self.frame4.size
            frame6.origin.x = self.scrollView.frame.size.width * CGFloat(index) + 30
            frame6.size = self.frame6.size
        
            self.scrollView.isPagingEnabled = true
            
            let subView = UIImageView(frame: frame)
            let name = UILabel(frame: frame2)
            let title = UILabel(frame: frame4)
            var hash = UILabel(frame: frame6)
            searchButton = UIButton(frame: searchFrame)
            nowButton.setTitle("THINGS TO DO NOW", for: .normal)
            nowButton.titleLabel?.textColor = UIColor.white
            nowButton.titleLabel?.font = UIFont(name: "Montserrat-Regular", size: 14)
            nowButton.layer.cornerRadius = 20.0
            nowButton.layer.shadowColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
            nowButton.layer.shadowOffset = CGSize.init(width: 0, height: 10)
            nowButton.layer.shadowOpacity = 0.2
            searchButton.setTitle("Where to?", for: UIControlState.normal)
            searchButton.setImage(UIImage(named:"searchicon"), for: UIControlState.normal)
            searchButton.imageEdgeInsets = UIEdgeInsets(top: 0,left: -210,bottom: 0,right: 0)
            searchButton.titleEdgeInsets = UIEdgeInsets(top: 0,left: -195,bottom: 0,right: 0)
            searchButton.setTitleColor(UIColor.init(red: 170/255, green: 170/255, blue: 170/255, alpha: 1.0), for: UIControlState.normal)
            searchButton.titleLabel?.font = UIFont(name: "Avenir", size: 13)
            searchButton.layer.cornerRadius = 20.0
            searchButton.layer.shadowColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.2).cgColor
            searchButton.layer.shadowOffset = CGSize.init(width: 0, height: 10)
            searchButton.layer.shadowOpacity = 0.2
            searchButton.backgroundColor = UIColor.white
           
            hash = UILabel(frame: frame6)
            hash.text = hashtags[index]
            hash.textColor = UIColor.white
            hash.font = UIFont(name: "Avenir-Medium", size: 12)
            textView = UITextView(frame: frame3)
            name.text = names[index]
            name.font = UIFont(name: "Montserrat-Bold", size: 36)
            name.textColor = UIColor.white
            title.text = titles[index]
            title.font = UIFont(name: "Avenir-Black", size: 15)
            title.textColor = UIColor(red: 0, green: 255/255, blue: 204/255, alpha: 1.0)
            textView.text = descriptions[index]
            textView.font = UIFont(name: "Avenir-Medium", size: 16)
            textView.textColor = UIColor.white
            textView.backgroundColor = UIColor.clear
            textView.isEditable = false
            textView.isSelectable = false

       
            subView.image = images[index]
            self.scrollView .addSubview(subView)
            self.scrollView .addSubview(name)
            self.scrollView .addSubview(textView)
            self.scrollView .addSubview(title)
            self.scrollView .addSubview(hash)
            self.view .addSubview(pageControl)
            self.view .addSubview(nowButton)
            self.navigationController?.navigationBar.addSubview(searchButton)
                

            
            
        }
        

        self.scrollView.contentSize = CGSize(width: self.scrollView.frame.size.width * 4 , height: self.scrollView.frame.size.height);
        self.automaticallyAdjustsScrollViewInsets = false


        self.scrollView.contentOffset = CGPoint(x: 0, y: 0)
        scrollView = UIScrollView(frame: view.bounds)
        pageControl.addTarget(self, action: Selector(("changePage:")), for: UIControlEvents.touchUpInside)
//        
//        searchButton.addTarget(self.navigationController, action: Selector(("buttonAction:")), for: UIControlEvents.touchUpInside)
        
//        #selector(self.buttonAction(sender:))
        searchButton.addTarget(self, action: #selector(self.buttonAction(sender:)), for: UIControlEvents.touchUpInside)
        
     
        
    }
    

    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        let height: CGFloat = 41 //whatever height you want
        let bounds = self.navigationController!.navigationBar.bounds
        self.navigationController?.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: 82)
        self.navigationController?.navigationBar.addSubview(searchButton)
        
    }
    
    func configurePageControl() {
        // The total number of pages that are available is based on how many available colors we have.
        self.pageControl.numberOfPages = images.count
        self.pageControl.currentPage = 0
        self.pageControl.tintColor = UIColor.white
        self.pageControl.layer.position.y = self.view.frame.height - 150
 

       
        
    }
    
    
    
    func buttonAction(sender: UIButton!) {
        self.performSegue(withIdentifier: "segue3", sender: self)
        
        
        
    }
    
    @IBAction func location(_ segue:UIStoryboardSegue) {}
    
    

    

    
    // MARK : TO CHANGE WHILE CLICKING ON PAGE CONTROL
    func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * scrollView.frame.size.width
        scrollView.setContentOffset(CGPoint(x: x,y :0), animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


