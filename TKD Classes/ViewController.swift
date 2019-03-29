//
//  ViewController.swift
//  TKD Classes
//
//  Created by Jimson Vedua on 2/8/19.
//  Copyright © 2019 SameTeam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Variables and Constants
    var arrayOfDates: [String] = []
    var formattedDate: String = "formattedDate"
    
    // MARK: - Outlets
    @IBOutlet weak var datesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        datesTableView.tableFooterView?.isHidden = true
    }
    
    @IBAction func AddTodayClicked(_ sender: Any) {
        forDateFormatting()
        forOneSingleEntryPerDay()
    }
    
    func forOneSingleEntryPerDay() {
        if !arrayOfDates.contains(formattedDate) {
            arrayOfDates.append(formattedDate)
            arrayOfDates.sort()
            datesTableView.reloadData()
        }
    }
    
    func forDateFormatting() -> (String) {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .current
        dateFormatter.dateFormat = "MM/dd/yyyy"
        formattedDate = dateFormatter.string(from: date)
        return formattedDate
    }
    
    
}

//MARK: - TableView Methods
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ datesTableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section != numberOfSections() - 1 {
            return "Visits = \(section * 10 + 1) -> \((section + 1) * 10)"
        }
        else {
            let returnString = arrayOfDates.count % 10 == 1 ? "\(arrayOfDates.count)" : "\(section * 10 + 1) -> \(arrayOfDates.count)"
            return "Visits = \(returnString)"
        }
    }
    
    func numberOfSections() -> Int {
        let number = arrayOfDates.count % 10 == 0 ? (arrayOfDates.count/10) : (arrayOfDates.count/10) + 1
        return number
    }
}
