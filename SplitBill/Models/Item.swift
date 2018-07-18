//
//  Item.swift
//  SplitBill
//
//  Created by Emmie Ohnuki on 7/17/18.
//  Copyright © 2018 Emmie Ohnuki. All rights reserved.
//

import Foundation

class Item {
    var price: Double
    var numPeople: Int = 0
    var name: String
    var dividedPrice = 0.0
    
    init(price: Double, name: String){
        self.price = price
        self.name = name
    }
    
    func recalculateDividedPrice() {
        self.dividedPrice = price / Double(numPeople)
    }
}
