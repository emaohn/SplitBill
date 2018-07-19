//
//  AddMembersViewController.swift
//  SplitBill
//
//  Created by Emmie Ohnuki on 7/17/18.
//  Copyright © 2018 Emmie Ohnuki. All rights reserved.
//

import Foundation
import UIKit


class AddMembersViewController: UITableViewController {
    var members = [Person]()
    var items = [Item]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCellView", for: indexPath) as! MemberCellView
        let person = members[indexPath.row]
        cell.nameLabel.text = person.name
        cell.personSubtotalLabel.text = String(format:"%.2f", person.subtotal)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 1
        return members.count
    }
    
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
        for member in members {
            member.calculateSubtotal()
        }
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {return}
        
        switch identifier {
        case "doneWithPersons":
            print("done w ppl")
            let bill = Bill(members: members, items: items)
            let vc = segue.destination as? TotalViewController
            vc?.bill = bill
        case "backButton":
            print("back button pressed")
        case "addMember":
            let vc = segue.destination as? SelectItemsViewController
            vc?.items = self.items
        default:
            print("i dont recognize this")
        }
    }
}



