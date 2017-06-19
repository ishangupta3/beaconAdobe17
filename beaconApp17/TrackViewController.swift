//
//  TrackViewController.swift
//  beaconApp17
//
//  Created by ishgupta on 6/12/17.
//  Copyright © 2017 ishgupta. All rights reserved.
//

import UIKit
import CoreLocation

class TrackViewController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBOutlet weak var iBeaconFound: UILabel!
    @IBOutlet weak var proxmityUUID: UILabel!
    @IBOutlet weak var majorValue: UILabel!
    @IBOutlet weak var minorValue: UILabel!
    @IBOutlet weak var accuracy: UILabel!
    @IBOutlet weak var distance: UILabel!
    
    
    
    var locationManager : CLLocationManager!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
        locationManager = CLLocationManager.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
        
        
        locationManager.startRangingBeacons(in: beaconRegion1)
        locationManager.startRangingBeacons(in: beaconRegion2)
        locationManager.startRangingBeacons(in: beaconRegion3)
        locationManager.startRangingBeacons(in: beaconRegion4)
        
            }
    
    
    
   

    
    
    // Create Beacon Regions 
    
    

    
//    func getBeaconRegionInformation() -> CLBeaconRegion {
//        
//        let beaconRegion = CLBeaconRegion.init(proximityUUID: UUID.init(uuidString: "50905056-4A7E-4A93-B246-CED87A9BF743")!,
//                                               identifier: "com.beacon1.gupta")
//        
//        return beaconRegion
//        
//    }
//    
    
    //  Beacon Region 1
    let beaconRegion1 = CLBeaconRegion(
        proximityUUID: UUID(uuidString: beaconInformation["beacon1"]!["uuid"]!)!,
        identifier: "com.beacon1.gupta")

    
    // Beacon Region 2
    let beaconRegion2 = CLBeaconRegion(
        proximityUUID: UUID(uuidString: beaconInformation["beacon2"]!["uuid"]!)!,
        identifier: "com.beacon2.gupta")
    
    //  Beacon Region 3
    let beaconRegion3 = CLBeaconRegion(
        proximityUUID: UUID(uuidString: beaconInformation["beacon3"]!["uuid"]!)!,
        identifier: "com.beacon3.gupta")
    

    //  Beacon Region 4
    let beaconRegion4 = CLBeaconRegion(
        proximityUUID: UUID(uuidString: beaconInformation["beacon4"]!["uuid"]!)!,
        identifier: "com.beacon4.gupta")

    
    
    

    
  
    func startScanningForBeaconRegion(beaconRegion: CLBeaconRegion) {
        locationManager.startMonitoring(for: beaconRegion1)
        locationManager.startRangingBeacons(in: beaconRegion1)
        
        
        // ranging for beacon region 2
        
        locationManager.startMonitoring(for: beaconRegion2)
        locationManager.startRangingBeacons(in: beaconRegion2)
        
        
        // ranging for beacon Region 3
        
        locationManager.startMonitoring(for: beaconRegion3)
        locationManager.startRangingBeacons(in: beaconRegion3)
        
        
        // ranging for beacon Region 4
        
        locationManager.startMonitoring(for: beaconRegion4)
        locationManager.startRangingBeacons(in: beaconRegion4)

        
    }
    

    
    
        func locationManager(_ manager: CLLocationManager, didRangeBeacons beacons: [CLBeacon], in region: CLBeaconRegion) {
            
            let beacon = beacons.first  //checking for the first beacon in the range
            
            //beacon?.proximity == .immediate &&
            
         while beacons.count > 0 {
          
            
            if    didEnterProxmity(beacon: (beacon!)) == true {
    
                // we are checking if there any beacons in range
                    iBeaconFound.text = "iBeacon Found"
                    proxmityUUID.text = beacon?.proximityUUID.uuidString
                    majorValue.text = beacon?.major.stringValue
                    minorValue.text = beacon?.minor.stringValue
                    accuracy.text = String(describing: beacon!.accuracy)
                
                
                  
                    print(beacon?.description ?? "Beacon Not Found")
         
                    
                    print(getDateTime())
                    
                    
                    //   print(timeCounter(beacon: beacon!))
                    
                    // stop ranging for the beacon here
                    // include code where the user gets a notification to the phone of this and that
                    

    
                        if beacon?.proximity == CLProximity.unknown {
                            distance.text = "Unknown Location"
    
                            } else if  beacon?.proximity == CLProximity.far {
                            distance.text = "Far"
                            } else if beacon?.proximity == CLProximity.immediate {
                            distance.text = "Location: immediate"
                        }
                    
                break
                
    
               }    // else    {
//                iBeaconFound.text = "No Beacon Found"
//                proxmityUUID.text =  "Not Found"
//                majorValue.text = "Not Found"
//                minorValue.text = "Not Found"
//                accuracy.text = "Not Found"
//            }
//            
            
            }
            
                
      //  }  // end of contingency where user enters specified region -> to enable response
            
            print("Checking For Nearby Beacons")
            
    }
    
}



     
