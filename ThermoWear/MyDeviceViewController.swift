//
//  MyDeviceViewController.swift
//  ThermoWear
//
//  Created by Derek Jacobs on 2017-04-05.
//  Copyright © 2017 Derek Jacobs. All rights reserved.
//

import UIKit

class MyDeviceViewController: UIViewController {
    
    @IBOutlet weak var tempTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func submitTapped(_ sender: Any) {
        
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext // constant to be used
        let time = Date() //constant to then be used as the date/ time
        let reading = Reading(context: context)
        reading.temp = Double(tempTextField.text!)!
        reading.time = time as NSDate
        (UIApplication.shared.delegate as! AppDelegate).saveContext() // saves in core data
        if (reading.temp >= 40.0) || (reading.temp <= 35.0) {
            
            let alertController = UIAlertController(title: "WARNING:", message: "Dangerous body temperature detected; emergency contact has been notified!", preferredStyle: UIAlertControllerStyle.alert)
            
            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
            
            self.present(alertController, animated: true, completion: nil)
            
        } else {
            dismiss(animated: true, completion: nil)

        }
        
    //need to add switch for fahrenheit
    
}
}
