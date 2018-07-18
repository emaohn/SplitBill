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
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is SelectItemsViewController {
            let vc = segue.destination as? SelectItemsViewController
            vc?.items = items
        }
    }
}


