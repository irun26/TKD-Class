//
//  ViewController.swift
//  TKD Classes
//
//  Created by Jimson Vedua on 2/8/19.
//  Copyright © 2019 SameTeam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var datesTableView: UITableView!
    var arrayOfDates: [String] = []
    
    @IBAction func AddTodayClicked(_ sender: Any) {

        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .current
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let formattedDate = dateFormatter.string(from: date)
        
        arrayOfDates.append(formattedDate)
        datesTableView.reloadData()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datesTableView.tableFooterView?.isHidden = true

    }

    func tableView(_ datesTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return arrayOfDates.count
        if section != numberOfSections() - 1 || arrayOfDates.count % 10 == 0 {
            return 10
        }
        return arrayOfDates.count % 10
    }
    
    func tableView(_ datesTableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = datesTableView.dequeueReusableCell(withIdentifier: "dateAttended", for: indexPath)
        cell.textLabel?.text = "\(arrayOfDates[indexPath.row]) VISIT: \(indexPath.row + 1)"
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections()
    }

    func numberOfSections() -> Int {
        let number = arrayOfDates.count % 10 == 0 ? (arrayOfDates.count/10) : (arrayOfDates.count/10) + 1
        return number
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section != numberOfSections() - 1 {
            return "Visits = \(section * 10 + 1) -> \((section + 1) * 10)"
        }
        else {
            let returnString = arrayOfDates.count % 10 == 1 ? "\(arrayOfDates.count)" : "\(section * 10 + 1) -> \(arrayOfDates.count)"
            return "Visits = \(returnString)"
        }
    }
    
    

}

