//
//  model.swift
//  beaconApp17
//
//  Created by ishgupta on 6/13/17.
//  Copyright © 2017 ishgupta. All rights reserved.
//

import Foundation
import CoreLocation
import CoreBluetooth




// Getting a TimeStamp 


func getTimestamp() -> Int {
    return Int(Date().timeIntervalSince1970)
    
    
}



func getReadableTimestamp(_ format: String) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.timeStyle = .medium
    dateFormatter.timeZone = TimeZone(abbreviation: "PST")
    dateFormatter.dateFormat = format
    
    let datetime = dateFormatter.string(from: Date())
    
    return datetime
    
}

//func getDateTime() -> String    {
//    
//    let datetime = getReadableTimestamp("MM/dd/yyyy HH:mm:ss")
//    return "[\(datetime)]"
//    
//}


func getDateTime() -> String    {
    
    let datetime = getReadableTimestamp("mm:ss")
    return "[\(datetime)]"
    
   
    
}



 

