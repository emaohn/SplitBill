//
//  tipTaxViewController.swift
//  SplitBill
//
//  Created by Emmie Ohnuki on 7/19/18.
//  Copyright © 2018 Emmie Ohnuki. All rights reserved.
//

import Foundation
import UIKit

class tipTaxViewController: UIViewController {
//    var items = [Item]()
//    var members = [Person]()
      var bill = Bill()
    
    @IBOutlet weak var taxAmountTextfield: UITextField!
    @IBOutlet weak var tipPercentTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {return}
        switch identifier {
        case "done":
            if segue.destination is AddMembersViewController {
                let vc = segue.destination as? AddMembersViewController
//                vc?.bill.allItems = self.items
//                vc?.bill.members = self.members
                  vc?.bill = self.bill
                if let taxAmount = Double((taxAmountTextfield.text!)) {
                    vc?.bill.taxAmount = taxAmount
                    print(bill.taxAmount)
                }
                if let tipPercent = Double((tipPercentTextField.text!)) {
                    vc?.bill.tipPercent = tipPercent/100
                    print(bill.tipPercent)
                }
            }
        case "back":
            if segue.destination is AddStuffViewController {
                let vc = segue.destination as? AddStuffViewController
                vc?.bill = self.bill
            }
        default:
            print("error")
        }
    }
    
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
        
    }
}
