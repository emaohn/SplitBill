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
<<<<<<< HEAD
    
    var items = [Item]() {
        didSet{
            tableView.reloadData()
        }
    }
=======
    var items = [Item]()
>>>>>>> origin/sakura/emmie-combined
    
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
<<<<<<< HEAD
                let item = Item(price: cost, name: (itemName?.text!)!, numPeople: 0)
=======
                let item = Item(price: cost, name: (itemName?.text!)!)
>>>>>>> origin/sakura/emmie-combined
                self.items.append(item)
                self.tableView.reloadData()
            } else {
                return
            }
        }
<<<<<<< HEAD
        
=======

>>>>>>> origin/sakura/emmie-combined
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
    
<<<<<<< HEAD
=======
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 1
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCellView", for: indexPath) as! ItemCellView
        let item = items[indexPath.row]
        cell.itemNameLabel.text = item.name
        cell.itemPriceLabel.text = String(format:"%.2f", item.price)
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is AddMembersViewController {
            let vc = segue.destination as? AddMembersViewController
            vc?.items = items
        }
    }
    
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
        
    }
>>>>>>> origin/sakura/emmie-combined
}
