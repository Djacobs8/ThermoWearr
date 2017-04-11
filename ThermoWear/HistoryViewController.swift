//
//  HistoryViewController.swift
//  ThermoWear
//
//  Created by Derek Jacobs on 2017-04-05.
//  Copyright © 2017 Derek Jacobs. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var historyTableView: UITableView!
    
    @IBOutlet weak var readingTextField: UITextField!
    
    var readings : [Reading] = [] //empty array of readings
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTableView.delegate = self //adjusted in class settings
        historyTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //function that gets core data readings
        getReadings()
        historyTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return readings.count //as many rows as there is readings
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        let reading = readings[indexPath.row]
        if  (reading.temp <= 35.0) || (reading.temp >= 40.0) {
            cell.textLabel?.text = "❗️\(reading.temp) °C taken at \(reading.time!)"
        }
        /*if reading.temp >= 40.9 {
            cell.textLabel?.text = "❗️\(reading.temp) °C taken at \(reading.time!)"
        }*/ else {
            cell.textLabel?.text = "\(reading.temp) °C taken at \(reading.time!)"
        }
        return cell
    }
    
    func getReadings() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do {
            readings = try context.fetch(Reading.fetchRequest())
        } catch {}
    }
    
    @IBAction func doneTapped(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            print("Deleting")
            let reading = readings[indexPath.row]
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext // read whats in the cell
            context.delete(reading)
            (UIApplication.shared.delegate as! AppDelegate).saveContext() // save changes
            do {
                readings = try context.fetch(Reading.fetchRequest()) //refetech data
                historyTableView.reloadData() // reload after
            } catch {
                print("otherwise we messed up")
            }
            
        }
    }
    
}
