//
//  Data.swift
//  PlanningSafar
//
//  Created by Raha Ghassemi on 12/3/16.
//  Copyright © 2016 Newschool. All rights reserved.
//

import Foundation

class Data {
   
    
    class Entry {
        let Location : String
        let Address : String
        let Tag : String
        let Time : String
        let Distance : String
        let Image : String
        let Thumbnail : String
        
        init(location : String, address : String, tag : String, time : String, distance : String, image : String, thumb : String) {
            self.Location = location
            self.Address = address
            self.Tag = tag
            self.Time = time
            self.Distance = distance
            self.Image = image
            self.Thumbnail = thumb
        }
    }
    
    var places = [
        Entry(location:"Dillinger's", address: "146 Evergreen Ave", tag: "food", time: "15 minutes walking", distance: "0.5 miles", image : "dillingers-1", thumb : "Dillingers"),
        Entry(location:"Mominette", address: "221 Knickerbocker Ave", tag: "food", time: "10 minutes driving", distance: "0.9 miles", image : "mominette-1", thumb : "Mominette"),
        Entry(location:"Maria Hernandez Park", address: "Knickerbocker Ave", tag: "greenspace", time: "8 minutes with public transit", distance: "0.9 miles", image: "maria", thumb : "MariaHernandez"),
        Entry(location:"Miles", address: "101 Wilson Ave", tag: "food", time: "7 minutes walking", distance: "0.7 miles", image : "miles-1", thumb : "Miles"),
        Entry(location:"Sincerely Burger", address: "41 Wilson Ave", tag: "food", time: "3 minutes walking", distance: "0.8 miles", image : "dillingers-1", thumb : "SincerelyBurger")

        ]
}
