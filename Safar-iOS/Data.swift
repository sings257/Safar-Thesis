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
        let Crowd : String
        let Address : String
        let Tag : String
        let Time : String
        let Distance : String
        let Image : String
        
        init(location : String, crowd : String, address : String, tag : String, time : String, distance : String, image : String) {
            self.Location = location
            self.Crowd = crowd
            self.Address = address
            self.Tag = tag
            self.Time = time
            self.Distance = distance
            self.Image = image
        }
    }
    
    var places = [
        Entry(location:"Washington Square Park", crowd: "currently mildly crowded", address: "55 5th Ave, New York NY", tag: "parks-1", time: "15 minutes walking", distance: "0.5 miles", image : "washingtonSquare"),
        Entry(location:"Citi Bike Station #2167", crowd: "currently not crowded", address: "100 Spring St, New York NY", tag: "bike", time: "3 minutes biking", distance: "1.3 miles", image : "citiBike"),
        Entry(location:"Supreme", crowd: "currently not crowded", address: "14 E 16th St, New York NY", tag: "shop", time: "10 minutes driving", distance: "5.5 miles", image : "supreme"),
        Entry(location:"Jack's Wife Freda", crowd: "currently mildly crowded", address: "12 Carmine St, New York NY", tag: "food", time: "2 minutes walking", distance: "0.1 miles", image : "jacksWife"),
        Entry(location:"Union Square Park", crowd: "currently very crowded", address: "600 4th Ave, New York NY", tag: "parks-1", time: "8 minutes with public transit", distance: "2.5 miles", image: "unionSquare"),
        Entry(location:"Chelsea Market", crowd: "currently very crowded", address: "16 8th Ave, New York NY", tag: "market", time: "7 minutes walking", distance: "0.8 miles", image : "chelsea"),
        Entry(location:"The Highline", crowd: "currently not crowded", address: "40 8th Ave, New York NY", tag: "landmark", time: "3 minutes walking", distance: "0.2 miles", image : "highline"),
        Entry(location:"Whitney Museum of Art", crowd: "currently mildly crowded", address: "2000 Park Ave, New York NY", tag: "culture", time: "6 minutes driving", distance: "2.0 miles", image: "whitney"),
        Entry(location:"Swift Hibernian Lounge", crowd: "currently very crowded", address: "30 4th St, New York NY", tag: "bar", time: "12 minutes walking", distance: "1.5 miles", image: "swiftBar")
        ]
}
