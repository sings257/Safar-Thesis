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





class ViewController: UIViewController, MGLMapViewDelegate {
    
   let data = Data()
    @IBOutlet weak var navButton: UIButton!
    
    
    @IBOutlet var mapView: MGLMapView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Hiding back button
        
        let backButton = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: navigationController, action: nil)
        navigationItem.leftBarButtonItem = backButton
        
        
        //Map
        
        mapView.delegate = self
        
        //Multiple locations on map
        
        var coordinates = [
            CLLocationCoordinate2DMake(40.7366, -73.9918),
            CLLocationCoordinate2DMake(40.7359, -73.9911),
            CLLocationCoordinate2DMake(40.7308, -73.9973),
            CLLocationCoordinate2DMake(40.731047, -73.99962),
            ]
        
        
        
//        var pointAnnotations = [MGLPointAnnotation]()
//        for coordinate in coordinates {
//            let point = MGLPointAnnotation()
//            point.coordinate = coordinate
//            point.title = "\(coordinate.latitude), \(coordinate.longitude)"
//            pointAnnotations.append(point)
//        }

        
//        
//        let parks1 = MGLPointAnnotation()
//        parks1.coordinate = CLLocationCoordinate2D(latitude: 40.7359, longitude:40.7359)
//        parks1.title = "Union Square"
//        parks1.subtitle = "6 E 16th St"
        
        let polyline = CustomPolyline(coordinates: &coordinates, count: UInt(coordinates.count))
        // Set the custom `color` property, later used in the `mapView:strokeColorForShapeAnnotation:` delegate method.
        polyline.color = UIColor(red: 77/255, green: 51/255, blue: 215/255, alpha: 1.0)
        
        mapView.addAnnotation(polyline)
        
        
//        var pointAnnotations = [MGLPointAnnotation]()
//        for coordinate in coordinates {
//            let point = MGLPointAnnotation()
//            point.coordinate = coordinate
//            point.title = "\(coordinate.latitude), \(coordinate.longitude)"
//            pointAnnotations.append(point)
//        }
        
        // Point Annotations
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
            // This dot image grows in size as more annotations are added to the array.
            point.image = UIImage(named: "park")!
            
            // Append each annotation to the array, which will be added to the map all at once.
            pointAnnotations.append(point)
        }
        
        // Add the point annotations to the map. This time the method name is plural.
        // If you have multiple annotations to add, batching their addition to the map is more efficient.
        mapView.addAnnotations(pointAnnotations)
        
        
        
        
        navButton.setImage(UIImage(named:"dropdown"), for: UIControlState.normal)
        navButton.imageEdgeInsets = UIEdgeInsets(top: 6,left: 125,bottom: 6,right: 8)
        navButton.titleEdgeInsets = UIEdgeInsets(top: 0,left: -10,bottom: 0,right: 14)
        navButton.setTitle("New York", for: UIControlState.normal)
        navButton.tintColor = UIColor(red: 77/255, green: 51/255, blue: 215/255, alpha: 1.0)
    }
    
    
    
    
    
    
    
//    func mapView(_ mapView: MGLMapView, imageFor annotation: MGLAnnotation) -> MGLAnnotationImage? {
//        
//        var annotationImage = mapView.dequeueReusableAnnotationImage(withIdentifier: "parks1")
//        
//        if annotationImage == nil {
//            // Leaning Tower of Pisa by Stefan Spieler from the Noun Project.
//            var image = UIImage(named: "park")!
//            
//            // The anchor point of an annotation is currently always the center. To
//            // shift the anchor point to the bottom of the annotation, the image
//            // asset includes transparent bottom padding equal to the original image
//            // height.
//            //
//            // To make this padding non-interactive, we create another image object
//            // with a custom alignment rect that excludes the padding.
//            image = image.withAlignmentRectInsets(UIEdgeInsetsMake(0, 0, image.size.height/2, 0))
//            
//            // Initialize the ‘pisa’ annotation image with the UIImage we just loaded.
//            annotationImage = MGLAnnotationImage(image: image, reuseIdentifier: "parks1")
//        }
//        
//        return annotationImage
//    }
    
    func CGRectMake(_ x: CGFloat, _ y: CGFloat, _ width: CGFloat, _ height: CGFloat) -> CGRect {
        return CGRect(x: x, y: y, width: width, height: height)
    }
    
//    func mapView(_ mapView: MGLMapView, viewFor annotation: MGLAnnotation) -> MGLAnnotationView? {
//        // This example is only concerned with point annotations.
//        guard annotation is MGLPointAnnotation else {
//            return nil
//        }
//        
//        // Use the point annotation’s longitude value (as a string) as the reuse identifier for its view.
//        let reuseIdentifier = "\(annotation.coordinate.longitude)"
//        
//        // For better performance, always try to reuse existing annotations.
//        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: reuseIdentifier)
//        
//        // If there’s no reusable annotation view available, initialize a new one.
//        if annotationView == nil {
//            annotationView = CustomAnnotationView(reuseIdentifier: reuseIdentifier)
//            annotationView!.frame = CGRectMake(0, 0, 20, 20)
//            
//            // Set the annotation view’s background color to a value determined by its longitude.
//            let hue = CGFloat(annotation.coordinate.longitude) / 100
//            annotationView!.backgroundColor = UIColor(hue: hue, saturation: 0.5, brightness: 1, alpha: 1)
//        }
//        
//        return annotationView
//    }
    
//    func dot(size: Int) -> UIImage {
//        let floatSize = CGFloat(size)
//        let rect = CGRectMake(0, 0, floatSize, floatSize)
//        let strokeWidth: CGFloat = 1
//        
//        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main.scale)
//        
//        let ovalPath = UIBezierPath(ovalIn: rect.insetBy(dx: strokeWidth, dy: strokeWidth))
//        UIColor.darkGray.setFill()
//        ovalPath.fill()
//        
//        UIColor.white.setStroke()
//        ovalPath.lineWidth = strokeWidth
//        ovalPath.stroke()
//        
//        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
//        UIGraphicsEndImageContext()
//        
//        return image
//    }

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


        
        // Or, if you’re using Swift 3 in Xcode 8.0, be sure to add an underscore before the method parameters:
    func mapView(_ mapView: MGLMapView, annotationCanShowCallout annotation: MGLAnnotation) -> Bool {
        // Always try to show a callout when an annotation is tapped.
        return true
    }
    

    func didReceiveMemoryWarning() {
        // Dispose of any resources that can be recreated.
    }





