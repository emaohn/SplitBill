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
//    var members = [Person]()
//    var items = [Item]()
    var personName: String = ""
    var person: Person?
    var bill = Bill()
//    var tax = 0.0
//    var tip = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func addButtonPressed(_ sender: Any) {
        addMembersButtonPressed(self)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCellView", for: indexPath) as! MemberCellView
        let person = bill.people[indexPath.row]
        cell.nameLabel.text = person.name
        person.calculateSubtotal()
        cell.personSubtotalLabel.text = String(format:"%.2f", person.subtotal)
        
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 1
        return bill.people.count
        
    }
    
    @IBAction func doneWithMembersPressed(_ sender: Any) {
        
        var notSelectedItems = [Item]()
        
        for item in bill.allItems {
            if item.numPeople == 0 {
                notSelectedItems.append(item)
            }
        }
        
        if notSelectedItems.count > 0 {
            alert(notSelectedItems: notSelectedItems)
        }
        else {
            self.performSegue(withIdentifier: "doneWithPersons", sender: self)
        }
    }
    
    func convertToString(items: [Item])-> String{
        var ret: String = "/n"
        for item in items {
            ret += item.name + "\n"
        }
        return ret
    }
    
    func alert(notSelectedItems: [Item]){
        let alertController = UIAlertController(title: "WARNING", message: "You have items that have not been claimed! They are: \(convertToString(items: notSelectedItems))", preferredStyle: UIAlertControllerStyle.alert)
        // Create the actions
        let okAction = UIAlertAction(title: "Force Continue", style: UIAlertActionStyle.default) {
            UIAlertAction in
            self.performSegue(withIdentifier: "doneWithPersons", sender: self)
        }
        
        let cancelAction = UIAlertAction(title: "Fix", style: UIAlertActionStyle.cancel) {
            UIAlertAction in
            NSLog("Fix Pressed")
        }
        
        // Add the actions
        alertController.addAction(okAction)
        alertController.addAction(cancelAction)
        
        // Present the controller
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        person = bill.people[indexPath.row]
        self.performSegue(withIdentifier: "editPersonItems", sender: self)
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
                self.person = Person(name: self.personName)
                self.bill.people.append(self.person!)
                self.performSegue(withIdentifier: "moveToSelectItems", sender: self)
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
        for member in bill.people {
            member.calculateSubtotal()
        }
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        var person = bill.people[indexPath.row]
        for item in person.items {
            item.numPeople -= 1
            item.recalculateDividedPrice()
            print(item.numPeople)
            print(item.dividedPrice)
        }
        
        if editingStyle == .delete {
            bill.people.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.automatic)
            self.tableView.reloadData()
        }
        
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {return}
        
        switch identifier {
        case "doneWithPersons":
            let vc = segue.destination as? TotalViewController
            vc?.bill = bill
        case "backButton":
            let vc = segue.destination as? AddStuffViewController
//            vc?.items = self.items
//            vc?.members = self.members
                vc?.bill = self.bill
        case "moveToSelectItems":
            let vc = segue.destination as? SelectItemsViewController
            vc?.bill = self.bill
            vc?.member = self.person!
        case "editPersonItems":
            let vc = segue.destination as? SelectItemsViewController
            vc?.bill = self.bill
            vc?.member = self.person!    

        default:
            print("i dont recognize this")
        }
    }
}


