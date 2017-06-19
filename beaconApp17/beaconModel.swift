//
//  beaconModel.swift
//  beaconApp17
//
//  Created by ishgupta on 6/14/17.
//  Copyright © 2017 ishgupta. All rights reserved.
//

import Foundation
import CoreLocation
import CoreBluetooth




func didEnterProxmity(beacon: CLBeacon) -> Bool {
    
        if  beacon.accuracy < 15 {
        
          //  print("User has entered Region")
            return true
        
        } else {
        
           //  print("User has exited Region")
            
            return false
        }
    
    
    }

    
    func timeCounter(beacon: CLBeacon) -> Int  {
        
         var count = 0
        if beacon.accuracy < 7 {
            
           
            count += 1
        }
        
        return Int(count)
    }




/*
 
 
 func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
 let beacon = beacons.first //checking for the last beacon in the range
 
 if beacons.count > 0 { // we are checking if there any beacons in range
 iBeaconFound.text = "iBeacon Found"
 proxmityUUID.text = beacon?.proximityUUID.uuidString
 majorValue.text = beacon?.major.stringValue
 minorValue.text = beacon?.minor.stringValue
 accuracy.text = String(describing: beacon!.accuracy)
 
 
 // this is where to check the region of the beacon - > include a constraint
 
 if beacon?.proximity == CLProximity.unknown {
 distance.text = "Unknown Location"
 
 } else if  beacon?.proximity == CLProximity.far {
 distance.text = "Far"
 } else if beacon?.proximity == CLProximity.immediate {
 distance.text = "Location: immediate"
 }
 
 accuracy.text = String(describing: beacon?.accuracy)
 
 } else {
 iBeaconFound.text = "No Beacon Found"
 proxmityUUID.text =  "Not Found"
 majorValue.text = "Not Found"
 minorValue.text = "Not Found"
 accuracy.text = "Not Found"
 
 }
 
 print("Ranging")
 
 }
 
 
 */






        func sendRespectiveData() {
    //NEEDS TO BE SENT ONLY ONCE - EVEN IF BEACON IS BEING RECOGNIZED EVERY SECOND
            //Date
            //Time
            //Location of the Beacon
            // USER ID
            // Time spent in the region
            
            
            
        }

/*
            1) Create a timer that depends how long the person spends in the region
            2) Work on sending notifications  for cafeteria - function
            3) Set up Username / Password - > Database Schema
            4) Mongo ???
     
     
 
 */
    
    
  
    

    
