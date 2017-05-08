//
//  ViewController.swift
//  My_Mapbox
//
//  Created by Shikha Singh on 12/1/16.
//  Copyright © 2016 Shikha Singh. All rights reserved.
//

import UIKit
import Mapbox
import CoreLocation





class CityViewController: UIViewController, MGLMapViewDelegate{
    
    let data = Data()
    //    @IBOutlet weak var navButton: UIButton!
    //
    //
    
    @IBOutlet var mapView: MGLMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Hiding back button
        
        let backButton2 = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton2
        let image = UIImage(named: "List")
        
        
        
        let backButton = UIBarButtonItem.init(title: " ", style: UIBarButtonItemStyle.plain, target: self, action: #selector(self.back(sender:)))
        backButton.image = image
        UIBarButtonItem.appearance().setBackButtonBackgroundImage(image, for: .normal, barMetrics: .default)
        
        self.navigationItem.setRightBarButton(backButton, animated: true)
        
        //Map
        mapView.delegate = self
        
        //Multiple locations on map
        
        var coordinates = [CLLocationCoordinate2DMake(40.7050888, -73.93358490000003),CLLocationCoordinate2DMake(40.6795595, -73.98681479999999),CLLocationCoordinate2DMake(40.7028639, -73.92915019999998),CLLocationCoordinate2DMake(40.6806787, -74.00926930000003)]
        
        
        
        let polyline = CustomPolyline(coordinates: &coordinates, count: UInt(coordinates.count))
        // Set the custom `color` property, later used in the `mapView:strokeColorForShapeAnnotation:` delegate method.
        polyline.color = UIColor(red: 77/255, green: 51/255, blue: 215/255, alpha: 1.0)
        
        mapView.addAnnotation(polyline)
        
        
        // Add a custom point annotation for every coordinate (vertex) in the polyline.
        var pointAnnotations = [CustomPointAnnotation]()
        for coordinate in coordinates {
            let count = pointAnnotations.count + 1
            let point = CustomPointAnnotation(coordinate: coordinate,
                                              title: "\(data.places[count].Location)",
                subtitle: nil)
            
            // Set the custom `image` and `reuseIdentifier` properties, later used in the `mapView:imageForAnnotation:` delegate method.
            // Create a unique reuse identifier for each new annotation image.
                            point.reuseIdentifier = "customAnnotation\(count)"
            //                // This dot image grows in size as more annotations are added to the array.
                            point.image = UIImage(named: "marker")!
            
            // Append each annotation to the array, which will be added to the map all at once.
                            pointAnnotations.append(point)
        }
        
        // Add the point annotations to the map. This time the method name is plural.
        // If you have multiple annotations to add, batching their addition to the map is more efficient.
        mapView.addAnnotations(pointAnnotations)
        
        
        
        
        
    }
    func back(sender: UIBarButtonItem) {
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    
    
    
    
    
    
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
    
    // MARK: - MGLMapViewDelegate methods
    
    func mapView(_ mapView: MGLMapView, imageFor annotation: MGLAnnotation) -> MGLAnnotationImage? {
        if let point = annotation as? CustomPointAnnotation,
            let image = point.image,
            let reuseIdentifier = point.reuseIdentifier {
            
            if let annotationImage = mapView.dequeueReusableAnnotationImage(withIdentifier: reuseIdentifier) {
                // The annotatation image has already been cached, just reuse it.
                return annotationImage
            } else {
                // Create a new annotation image.
                return MGLAnnotationImage(image: image, reuseIdentifier: reuseIdentifier)
            }
        }
        
        // Fallback to the default marker image.
        return nil
    }
    
    func mapView(_ mapView: MGLMapView, strokeColorForShapeAnnotation annotation: MGLShape) -> UIColor {
        if let annotation = annotation as? CustomPolyline {
            // Return orange if the polyline does not have a custom color.
            return annotation.color ?? UIColor(red: 77/255, green: 51/255, blue: 215/255, alpha: 1.0)
        }
        
        // Fallback to the default tint color.
        return mapView.tintColor
    }
    
    
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        // Always try to show a callout when an annotation is tapped.
        return true
    }
    
    
    
    
}



func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
    return true
}






func didReceiveMemoryWarning() {
    // Dispose of any resources that can be recreated.
}








