//
//  TotalViewController.swift
//  SplitBill
//
//  Created by Emmie Ohnuki on 7/17/18.
//  Copyright © 2018 Emmie Ohnuki. All rights reserved.
//

import Foundation
import UIKit

class TotalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var bill = Bill(members: [], items: [])
    
    @IBOutlet weak var totalTableView: TotalTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalTableView.bill = bill
        print(bill.total)
        totalTableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bill.people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personTotalViewCell", for: indexPath) as! TotalTableViewCell
        let person = bill.people[indexPath.row]
        cell.personNameLabel.text = person.name
        cell.personTotalLabel.text = String(format:"%.2f", person.total)
        
        return cell
    }
    
}
