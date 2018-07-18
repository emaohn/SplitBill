//
//  SelectItemsViewController.swift
//  SplitBill
//
//  Created by Emmie Ohnuki on 7/17/18.
//  Copyright © 2018 Emmie Ohnuki. All rights reserved.
//

import Foundation
import UIKit

class SelectItemsViewController: UITableViewController {
    var items = [Item]()
    var member = Person(name: "Name")
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemSelectionCell", for: indexPath) as! ItemSelectionCell
        let item = items[indexPath.row]
        cell.itemNameLabel.text = item.name
        cell.priceLabel.text = String(format:"%.2f", item.price)
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
                var item = items[indexPath.row]
                member.items.append(item)
                item.numPeople += 1
                item.recalculateDividedPrice()
            } else {
                cell.accessoryType = .none
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {return}
        
        switch identifier {
        case "cancelSelectItems":
            print("cancel")
    
        case "doneSelectItems":
            let vc = segue.destination as! AddMembersViewController
            vc.members.append(self.member)
            
        default:
            print("i dont recognize this")
        }
    }

}
