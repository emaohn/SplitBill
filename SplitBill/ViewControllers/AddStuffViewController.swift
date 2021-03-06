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
    
    var items = [Item]() {
        didSet{
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCellView", for: indexPath) as! ItemCellView
        let item = items[indexPath.row]
        cell.itemNameLabel.text = item.name
        cell.itemPriceLabel.text = String(format:"%.2f", item.price)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    @IBAction func addItemButtonPressed(_ sender: UIBarButtonItem) {
        
        // Create the alert controller
        let alertController = UIAlertController(title: "Add Item", message: "", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Item Name"
        }
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "$0.00"
        }
        // Create the actions
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            UIAlertAction in
            let itemName = alertController.textFields![0] as UITextField?
            let itemPrice = alertController.textFields![1] as UITextField?
            if let cost = Double((itemPrice?.text!)!) {
                let item = Item(price: cost, name: (itemName?.text!)!, numPeople: 0)
                self.items.append(item)
                self.tableView.reloadData()
            } else {
                return
            }
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel) {
            UIAlertAction in
            NSLog("Cancel Pressed")
            //do nothing
        }
        
        // Add the actions
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        // Present the controller
        self.present(alertController, animated: true, completion: nil)
    }
    
}
