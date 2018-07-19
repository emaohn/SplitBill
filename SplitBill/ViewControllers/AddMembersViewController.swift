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
    var personName: String = ""

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
    
    func addMembersButtonPressed(_ sender: Any) {
        // Create the alert controller
        let alertController = UIAlertController(title: "Person's Name", message: "", preferredStyle: UIAlertControllerStyle.alert)
        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter Person's Name"
        }
        // Create the actions
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
            UIAlertAction in
            if let personNameTextField = alertController.textFields![0] as UITextField? {
                self.personName = personNameTextField.text!
                print(self.personName)
            } else {return}
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
            addMembersButtonPressed(self)
            let vc = segue.destination as? SelectItemsViewController
            vc?.items = self.items
            vc?.member.name = self.personName

        default:
            print("i dont recognize this")
        }
    }
}


