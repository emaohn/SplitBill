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
    var bill = Bill()
    var person = Person(name: "Name")
    
    @IBOutlet weak var totalTableView: TotalTableView!
    @IBOutlet weak var grandTotalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bill.calculate()
        print(bill.total)
        totalTableView.bill = bill
        grandTotalLabel.text = "$" + String(format:"%.2f", bill.total)
        totalTableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bill.people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personTotalViewCell", for: indexPath) as! TotalTableViewCell
        let person = bill.people[indexPath.row]
        cell.personNameLabel.text = person.name
        cell.personTotalLabel.text = "$" + String(format:"%.2f", person.total)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        person = bill.people[indexPath.row]
        print("\(person.name) selected")
        self.performSegue(withIdentifier: "breakdown", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {return}

        switch identifier {
        case "breakdown":
            let vc = segue.destination as? BreakdownViewController
            vc?.person = self.person
            print("going to breakdown page")
        default:
            print("i dont recognize this")
        }

    }
}
