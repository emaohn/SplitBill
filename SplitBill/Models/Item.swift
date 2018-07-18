//
//  Item.swift
//  SplitBill
//
//  Created by Emmie Ohnuki on 7/17/18.
//  Copyright © 2018 Emmie Ohnuki. All rights reserved.
//

import Foundation

struct Item {
    var price: Double
    var name: String
    var numPeople: Int
    
    init(price: Double, name: String, numPeople: Int){
        self.price = price
        self.name = name
        self.numPeople = numPeople
    }
    
}
