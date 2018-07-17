//
//  Person.swift
//  SplitBill
//
//  Created by Emmie Ohnuki on 7/17/18.
//  Copyright © 2018 Emmie Ohnuki. All rights reserved.
//

import Foundation

struct Person {
    var name: String
    var total: Double
    var subtotal: Double
    var items: [Item]
    
    init(name: String) {
        self.name = name
        self.total = 0.0
        self.subtotal = 0.0
        self.items = []
    }
}
