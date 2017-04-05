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
    
    var reading : [Reading] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyTableView.delegate = self
        historyTableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reading.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func getReadings() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        do{
            reading = try context.fetch(Reading.fetchRequest()) as! [Reading]
        } catch{
            print("OH SHIT OH SHIT")
        }
    }
    
    @IBAction func doneTapped(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
}
