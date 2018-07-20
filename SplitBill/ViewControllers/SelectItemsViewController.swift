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
//    var items = [Item]()
    var member: Person?
    var bill = Bill()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bill.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemSelectionCell", for: indexPath) as! ItemSelectionCell
        let item = bill.allItems[indexPath.row]
        cell.itemNameLabel.text = item.name
        cell.priceLabel.text = String(format:"%.2f", item.price)
        for memberItem in (member?.items)! {
            if item.name == memberItem.name {
                cell.accessoryType = .checkmark
            }
        }
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            if cell.accessoryType == .none {
                cell.accessoryType = .checkmark
                let item = bill.allItems[indexPath.row]
                member?.items.append(item)
                item.numPeople += 1
                item.recalculateDividedPrice()
            } else if cell.accessoryType == .checkmark {
                cell.accessoryType = .none
                let item = bill.allItems[indexPath.row]
                for index in 0...(member?.items.count)! {
                    if item.name == (member?.items[index].name)! {
                        member?.items.remove(at: index)
                        item.numPeople -= 1
                        item.recalculateDividedPrice()
                        break
                    }
                }
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
            
        default:
            print("i dont recognize this")
        }
    }

}
