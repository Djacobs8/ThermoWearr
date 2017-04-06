//
//  NewDevViewController.swift
//  ThermoWear
//
//  Created by Derek Jacobs on 2017-04-06.
//  Copyright © 2017 Derek Jacobs. All rights reserved.
//

import UIKit

class NewDevViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func cancelTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    /*import CoreBluetooth
    
    class AddNewViewController: UIViewController, CBCentralManagerDelegate, CBPeripheralDelegate {
        
        var manager : CBCentralManager! // no optional given for these decs
        var peripheral : CBPeripheral!
        
        // @IBAction func searchTapped(_ sender: Any) {
        // "\(NSUUID().uuidString" for uniques
        let BEAN_Name = "Temp"
        let BEAN_Scratch_UUID = CBUUID(string: "a495ff21-c5b1-4b44-b512-1370f02d74de")
        let BEAN_Service_UUID = CBUUID(string: "a495ff20-c5b1-4b44-b512-1370f02d74de")
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            manager = CBCentralManager(delegate: self, queue: nil)
            
            // Do any additional setup after loading the view.
        }
        
        
        func centralManagerDidUpdateState(_ central: CBCentralManager) {
            if central.state == CBManagerState.poweredOn {
                central.scanForPeripherals(withServices: nil, options: nil)
            } else {
                print("Bluetooth not available")
            }
        }
        
        func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
            let device = (advertisementData as NSDictionary).object(forKey: CBAdvertisementDataLocalNameKey) as? NSString
            
            if device?.contains(BEAN_Name) == true {
                self.manager.stopScan()
                
                self.peripheral = peripheral
                self.peripheral.delegate = self
                
                manager.connect(peripheral, options: nil)
            }
        }
        
        func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
            print("Attempting to get services...")
            peripheral.discoverServices(nil)
            
        }
        
        func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
            for service in peripheral.services!{
                let thisService = service as CBService
                
                print("Service: ", service.uuid)
                
                if service.uuid == BEAN_Service_UUID {
                    print("Using scratch.")
                    peripheral.discoverCharacteristics(nil, for: thisService)
                }
            }
        }
        
        func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
            print("Enabling ...")
            
            for characteristic in service.characteristics! {
                let thisCharacteristic = characteristic as CBCharacteristic
                
                print("Characteristic: ", thisCharacteristic.uuid)
                
                if thisCharacteristic.uuid == BEAN_Scratch_UUID {
                    print("Set to notify: ", thisCharacteristic.uuid)
                    
                    // Prepare to show data
                    
                    self.peripheral.setNotifyValue(true, for: thisCharacteristic)
                }
            }
        }
        
        func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?) {
            
        }
        
        func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?) {
            debugPrint("Disconnected.")
            
            central.scanForPeripherals(withServices: nil, options: nil)
            
            // Hide respective user interface
        }
        
        @IBAction func cancelTapped(_ sender: Any) {
            
            dismiss(animated: true, completion: nil)
            
        }*/
    // code for BLE connectivity, buggy ATM, disabled for PT viewing reasons

}
