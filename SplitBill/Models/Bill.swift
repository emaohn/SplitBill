//
//  Bill.swift
//  SplitBill
//
//  Created by Sakura Rapolu on 7/18/18.
//  Copyright © 2018 Emmie Ohnuki. All rights reserved.
//

import Foundation

class Bill {
        var tipPercent: Double = 0.15
        var taxAmount: Double = 10.00
        var allItems: [Item] = []
        var total: Double = 0
        var subtotal: Double = 0
        var people: [Person] = []
    
    init(members: [Person], items: [Item]){
        self.allItems = items
        for item in allItems {
            subtotal += item.price
        }
        people = members
        calculate()
        total = Double((tipPercent*subtotal + subtotal + taxAmount))
    }
    
    func calculateMemberTaxAmount(person: Person) -> Double{
        return taxAmount * (person.subtotal / subtotal)
    }
    
    func calculateMemberTipAmount(person: Person) -> Double{
        return tipPercent * person.subtotal
    }
    
    func totalMemberAmount (person: Person) -> Double{
        return person.subtotal + calculateMemberTaxAmount(person: person) + calculateMemberTipAmount(person: person)
    }
    
    func calculate(){
        for person in people {
            person.total = totalMemberAmount(person: person)
           // total += person.total
        }
    }
}
