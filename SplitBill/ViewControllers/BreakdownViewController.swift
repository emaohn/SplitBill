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
    @IBOutlet weak var subtotalPriceLabel: UILabel!
    @IBOutlet weak var taxAmountLabel: UILabel!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var grandTotalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        personNameLabel.text = person.name + "'s Breakdown"
        subtotalPriceLabel.text = "$" + String(format: "%.2f", person.subtotal)
        taxAmountLabel.text = "$" + String(format: "%.2f", person.tax)
        tipAmountLabel.text = "$" + String(format: "%.2f", person.tip)
        grandTotalLabel.text = "$" + String(format: "%.2f", person.total)
        itemsTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
