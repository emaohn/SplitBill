//
//  Bill.swift
//  SplitBill
//
//  Created by Sakura Rapolu on 7/18/18.
//  Copyright © 2018 Emmie Ohnuki. All rights reserved.
//

import Foundation

class Bill {
        var tipPercent: Double = 0
        var taxAmount: Double = 0
        var allItems: [Item] = []
        var total: Double = 0
        var subtotal: Double = 0
        var people: [Person] = []
    
    init() {
        
    }
    
    func calculateMemberTaxAmount(person: Person) -> Double{
        let tax = taxAmount * (person.subtotal / subtotal)
        person.tax = tax
        
        print("person subtotal: \(person.subtotal)")
        print("tax: \(person.tax)")
        print("bill subtotal: \(subtotal) bill's tax: \(tax)")
        return tax
        
    }
    
    func calculateMemberTipAmount(person: Person) -> Double{
        let tip = tipPercent * person.subtotal
        person.tip = tip
        return tip
    }
    
    func totalMemberAmount (person: Person) -> Double{
        return person.subtotal + calculateMemberTaxAmount(person: person) + calculateMemberTipAmount(person: person)
    }
    
    func calculate(){
        total = 0
        subtotal = 0
        for item in allItems {
            subtotal += item.price
        }
       // total = Double((tipPercent*subtotal + subtotal + taxAmount))
        for person in people {
            person.total = totalMemberAmount(person: person)
            total += person.total
        }
    }
}
