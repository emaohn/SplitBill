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
    var items = [Item]()
    var members = [Person]()
    
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
                vc?.items = self.items
                vc?.members = self.members
                if let taxAmount = Double((taxAmountTextfield.text!)) {
                    vc?.tax = taxAmount
                }
                if let tipPercent = Double((tipPercentTextField.text!)) {
                    vc?.tip = tipPercent
                }
            }
        default:
            print("error")
        }
    }
    
    @IBAction func unwindWithSegue(_ segue: UIStoryboardSegue) {
        
    }
}
