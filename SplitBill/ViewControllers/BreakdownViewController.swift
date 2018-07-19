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
    var bill = Bill(members: [], items: [])
    
    @IBOutlet weak var itemsTableView: BreakdownTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemsTableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bill.people.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemTableViewCell", for: indexPath) as! BreakdownTableViewCell
        let item = bill.allItems[indexPath.row]
        cell.itemNameLabel.text = item.name
        cell.itemPriceLabel.text = String(format:"%.2f", item.dividedPrice)
        
        return cell
    }
}
