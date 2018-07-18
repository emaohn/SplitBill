//
//  addItemsViewController.swift
//  SplitBill
//
//  Created by Emmie Ohnuki on 7/17/18.
//  Copyright © 2018 Emmie Ohnuki. All rights reserved.
//

import Foundation
import UIKit

class AddItemsViewController: UITableViewController {
    
    var currentBill = Bill()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func addItemButtonPressed(_ sender: UIBarButtonItem) {
        var itemName: String?
        var itemPrice: Double?
        
        // Create the alert controller
        let alertController = UIAlertController(title: "Add Item", message: "", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Item Name"
            itemName = textField.text
        }
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "$0.00"
            itemPrice = textField.text as? Double
        }
        // Create the actions
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            UIAlertAction in
            if let _ = itemName,
                let _ = itemPrice {
                let item = Item(price: itemPrice!, name: itemName!, numPeople: 0)
                currentBill.allItems.append(item)
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
