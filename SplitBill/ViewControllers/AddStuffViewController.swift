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
        }
        // Create the actions
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            UIAlertAction in
            let itemName = alertController.textFields![0] as UITextField?
            let itemPrice = alertController.textFields![1] as UITextField?
            //let item = Item(price: (itemPrice?.text!)!, name: (itemName?.text!)!, numPeople: 0)
            print("item name: \((itemName?.text!)!)")
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
