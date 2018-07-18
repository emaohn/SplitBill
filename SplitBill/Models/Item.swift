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
    var numPeople: Int = 0
    var name: String
    
    init(price: Double, name: String){
        self.price = price
        self.name = name
    }
    
}
