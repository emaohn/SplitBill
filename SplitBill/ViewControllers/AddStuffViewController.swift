//
//  addItemsViewController.swift
//  SplitBill
//
//  Created by Emmie Ohnuki on 7/17/18.
//  Copyright © 2018 Emmie Ohnuki. All rights reserved.
//

import Foundation
import UIKit

class AddStuffViewController: UITableViewController {
    var bill = Bill()
//    var items = [Item]()
//    var members = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func addItemButtonPressed(_ sender: UIBarButtonItem) {
        // Create the alert controller
        let alertController = UIAlertController(title: "Add Item", message: "", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Item Name"
        }
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Price"
            textField.keyboardType = .decimalPad
        }
        // Create the actions
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            UIAlertAction in
            let itemName = alertController.textFields![0] as UITextField?
            let itemPrice = alertController.textFields![1] as UITextField?
            if let cost = Double((itemPrice?.text!)!) {
                let item = Item(price: cost, name: (itemName?.text!)!)
                self.bill.allItems.append(item)
                self.tableView.reloadData()
            } else {
                return
            }
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) {
            UIAlertAction in
            NSLog("Cancel Pressed")
        }
        
        // Add the actions
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        // Present the controller
        self.present(alertController, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 1
        return bill.allItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCellView", for: indexPath) as! ItemCellView
        let item = bill.allItems[indexPath.row]
        cell.itemNameLabel.text = item.name
        cell.itemPriceLabel.text = "$" + String(format:"%.2f", item.price)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let deletedItem = bill.allItems[indexPath.row]
            for person in bill.people {
                for index in 0...person.items.count {
                    if deletedItem.name == person.items[index].name && deletedItem.price == person.items[index].price {
                        person.items.remove(at: index)
                    }
                    break
                }
            }
            bill.allItems.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            self.tableView.reloadData()
            
            
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is tipTaxViewController {
            let vc = segue.destination as? tipTaxViewController
//            vc?.items = items
//            vc?.members = members
                vc?.bill = self.bill
        }
    }
    
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
        
    }
}
