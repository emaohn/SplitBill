//
//  BreakdownViewController.swift
//  SplitBill
//
//  Created by Emmie Ohnuki on 7/17/18.
//  Copyright © 2018 Emmie Ohnuki. All rights reserved.
//

import Foundation
import UIKit

class BreakdownViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    var person = Person(name: "default")
    
    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var itemsTableView: BreakdownTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personNameLabel.text = person.name
        itemsTableView.reloadData()
        print(person.name + "hello")
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(person.items.count)
        return (person.items.count)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemTableViewCell", for: indexPath) as! BreakdownTableViewCell
        let item = person.items[indexPath.row]
        cell.itemNameLabel.text = item.name
        cell.itemPriceLabel.text = String(format:"%.2f", (item.dividedPrice))
        
        return cell
    }
}
