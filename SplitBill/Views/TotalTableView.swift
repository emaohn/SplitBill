//
//  TotalTableView.swift
//  SplitBill
//
//  Created by Sakura Rapolu on 7/18/18.
//  Copyright © 2018 Emmie Ohnuki. All rights reserved.
//

import Foundation
import UIKit

class TotalTableView: UITableView {
    var bill = Bill(members: [])
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bill.people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personTotalViewCell ", for: indexPath) as! TotalTableViewCell
        let person = bill.people[indexPath.row]
        cell.personNameLabel.text = person.name
        cell.personTotalLabel.text = String(format:"%.2f", person.total)
        
        return cell
    }
}
