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
      var bill = Bill()
    

    @IBOutlet weak var taxAmountTextfield: UITextField!
    @IBOutlet weak var tipPercentTextField: UITextField!
    @IBOutlet weak var tiptaxView: UIView!
    
    func setupViews() {
        view.layer.shadowOffset = CGSize(width: 0, height: 1)
        view.layer.shadowOpacity = 0.05
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 35
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else {return}
        switch identifier {
        case "done":
            if segue.destination is AddMembersViewController {
                let vc = segue.destination as? AddMembersViewController
                  vc?.bill = self.bill
                if let taxAmount = Double((taxAmountTextfield.text!)) {
                    vc?.bill.taxAmount = taxAmount
                }
                if let tipPercent = Double((tipPercentTextField.text!)) {
                    vc?.bill.tipPercent = tipPercent/100
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
