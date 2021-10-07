//
//  RecordsViewController.swift
//  WhoWantToBeaMillionaire
//
//  Created by Кирилл Тарасов on 31.08.2021.
//

import Foundation
import UIKit

class RecordsViewController: UIViewController {
    
    @IBOutlet weak var recordsTableView: UITableView!
    
    let dateFormatrer: DateFormatter = {
        let dateForm = DateFormatter()
        dateForm.dateStyle = .short
        return dateForm
    }()
    
    var dateTextCache: [IndexPath: String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recordsTableView.dataSource = self
    }
}

extension RecordsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Game.shared.records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = recordsTableView.dequeueReusableCell(withIdentifier: "RecordCellIdentifier", for: indexPath)
        let record = Game.shared.records[indexPath.row]
        
        cell.textLabel?.text = getCellDateText(forIndexPath: indexPath, andDate: record.date)
        cell.detailTextLabel?.text = "Cash: \(record.Prize). Progress: \(String(format: "%.2f", record.percentCurrentAnswers * 100))%"
        return cell
    }
    
    func getCellDateText(forIndexPath indexPath: IndexPath, andDate date: Date) -> String {
        
        if let stringDate = dateTextCache[indexPath] {
            return stringDate
        } else {
            let stringDate = self.dateFormatrer.string(from: date)
            dateTextCache[indexPath] = stringDate
            return stringDate
        }
    }
}
