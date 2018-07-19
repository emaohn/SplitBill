//
//  Person.swift
//  SplitBill
//
//  Created by Emmie Ohnuki on 7/17/18.
//  Copyright © 2018 Emmie Ohnuki. All rights reserved.
//

import Foundation

class Person {
    var name: String
    var total: Double
    var subtotal: Double
    var items: [Item]
    var tax: Double
    var tip: Double
    
    init(name: String) {
        self.name = name
        self.total = 0.0
        self.subtotal = 0.0
        self.items = []
        self.tax = 0.0
        self.tip = 0.0
    }
    
    func calculateSubtotal() {
        subtotal = 0
        for item in items {
            subtotal += item.dividedPrice
        }
    }
}
