//
//  TransmitViewController.swift
//  beaconApp17
//
//  Created by ishgupta on 6/12/17.
//  Copyright © 2017 ishgupta. All rights reserved.
//

import UIKit
import CoreLocation
import CoreBluetooth // we are transmitting via bluetooth

class TransmitViewController: UIViewController, CBPeripheralManagerDelegate  {
    
    
    

    
    
    
    
    @IBOutlet weak var uuid: UILabel!
    @IBOutlet weak var majorValue: UILabel!
    @IBOutlet weak var minorValue: UILabel!
    @IBOutlet weak var identityValue: UILabel!
    var beaconRegion1: CLBeaconRegion!  //  creating Beacon Region 1
    var beaconRegion2: CLBeaconRegion!  //  creating Beacon Region 2
    var beaconRegion3: CLBeaconRegion!  //  creating Beacon Region 3
    var beaconRegion4: CLBeaconRegion!  // creating Beacon Region  4
    var beaconPeripheralData: NSDictionary! // creates a dictionary to store data
    var peripheralManaager: CBPeripheralManager!
    
    
    
    var transmitButtonBool = false
    
   var locationManager : CLLocationManager!
    
    
    @IBOutlet weak var transmitButton1: UIButton! // UIButton for transmit 1
    
    

  
    

    override func viewDidLoad() {
        super.viewDidLoad()
        initBeaconRegion()
        
        
        

        
    }
    
    
    func buttonColor(button: UIButton, y: Int) -> UIButton {
        
        button.backgroundColor = UIColor.black
        button.setTitle("Click To Transmit " + String(y), for: .normal)
        
        return button
        
    }
    
    
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        
        if peripheral.state == .poweredOn {
            peripheralManaager.startAdvertising((beaconPeripheralData as? [String : Any]?)!)
            print("Bluetooth is powered on")
        } else {
            peripheralManaager.stopAdvertising()
           
        }
        
    }
    
    
    // Button Tapped for BeaconRegion 1
    @IBAction func transmitButtonTapped(_ sender: Any) {
        beaconPeripheralData = beaconRegion1.peripheralData(withMeasuredPower: nil)
        peripheralManaager = CBPeripheralManager.init(delegate: self, queue: nil)
        
    
        transmitButtonBool = true
        
        initlabels(typeBeaconRegion: beaconRegion1)
        
        transmitButton1.backgroundColor = UIColor.red
        transmitButton1.setTitle("Now Transmitting - 1", for: .normal)
        transmitButton1.setTitleColor(UIColor.white, for: .normal)
        buttonColor(button: transmitButton2, y: 2)
        buttonColor(button: transmitButton3, y: 3)
        buttonColor(button: transmitButton4, y: 4)
        
       
        
     //   self.peripheralManagerDidUpdateState(peripheralManaager)
        
    }
    
    
    
    @IBOutlet weak var transmitButton2: UIButton!
    
    @IBAction func transmitButtonTapped2(_ sender: UIButton) {
        
        beaconPeripheralData = beaconRegion2.peripheralData(withMeasuredPower: nil)
        peripheralManaager = CBPeripheralManager.init(delegate: self, queue: nil)
        
        
        transmitButtonBool = true
        
        initlabels(typeBeaconRegion: beaconRegion2)
        
        transmitButton2.backgroundColor = UIColor.red
        transmitButton2.setTitle("Now Transmitting - 2", for: .normal)
        transmitButton2.setTitleColor(UIColor.white, for: .normal)
        buttonColor(button: transmitButton1, y: 1)
        buttonColor(button: transmitButton3, y: 3)
        buttonColor(button: transmitButton4, y: 4)
        
        
    }
    
    
    @IBOutlet weak var transmitButton3: UIButton!
    
    @IBAction func transmitButtonTapped3(_ sender: UIButton) {
        
        
        beaconPeripheralData = beaconRegion3.peripheralData(withMeasuredPower: nil)
        peripheralManaager = CBPeripheralManager.init(delegate: self, queue: nil)
        
        
        transmitButtonBool = true
        
        initlabels(typeBeaconRegion: beaconRegion3)
        
        transmitButton3.backgroundColor = UIColor.red
        transmitButton3.setTitle("Now Transmitting - 3", for: .normal)
        transmitButton3.setTitleColor(UIColor.white, for: .normal)
        buttonColor(button: transmitButton1, y: 1)
        buttonColor(button: transmitButton2, y: 2)
        buttonColor(button: transmitButton4, y: 4)
    
    }
    
    @IBOutlet weak var transmitButton4: UIButton!
    
    @IBAction func transmitButtonTapped4(_ sender: Any) {
        
        beaconPeripheralData = beaconRegion4.peripheralData(withMeasuredPower: nil)
        peripheralManaager = CBPeripheralManager.init(delegate: self, queue: nil)
        
        
        transmitButtonBool = true
        
        initlabels(typeBeaconRegion: beaconRegion4)
        
        transmitButton4.backgroundColor = UIColor.red
        transmitButton4.setTitle("Now Transmitting - 4", for: .normal)
        transmitButton4.setTitleColor(UIColor.white, for: .normal)
        buttonColor(button: transmitButton1, y: 1)
        buttonColor(button: transmitButton2, y: 2)
        buttonColor(button: transmitButton3, y: 3)
        
    }
    
    
    
    
    
    
    //
    
  
    
    
    func initBeaconRegion() {
        beaconRegion1 = CLBeaconRegion.init(proximityUUID:
            UUID.init(uuidString: "50905056-4A7E-4A93-B246-CED87A9BF743")!,
                                           major: 1230,
                                           minor: 100,
                                           identifier: "com.beacon1.gupta")
        
        
        beaconRegion2 = CLBeaconRegion.init(proximityUUID:
            UUID.init(uuidString:  "D4FCB121-A09F-4A06-AE00-011BD02FF94A")!,
                                            major: 2222,
                                            minor: 100,
                                            identifier: "com.beacon2.gupta")
        
        beaconRegion3 = CLBeaconRegion.init(proximityUUID:
            UUID.init(uuidString: "B6EDC187-A212-4FAD-B2F9-19B0C65DBA97")!,
                                            major: 3333,
                                            minor: 100,
                                            identifier: "com.beacon3.gupta")
        
        
        beaconRegion4 = CLBeaconRegion.init(proximityUUID:
            UUID.init(uuidString: "20194041-94B1-4899-A339-3C1CA6C37C4E")!,
                                            major: 4444,
                                            minor: 100,
                                            identifier: "com.beacon4.gupta")
        
        
        
        
        
        
        
    }
    
    
    
    
    
    


    
    func initlabels(typeBeaconRegion: CLBeaconRegion) {
        uuid.text = typeBeaconRegion.proximityUUID.uuidString
        majorValue.text = typeBeaconRegion.major?.stringValue
        minorValue.text = typeBeaconRegion.minor?.stringValue
        identityValue.text = typeBeaconRegion.identifier
        
    }



}
