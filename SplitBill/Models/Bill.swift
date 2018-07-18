//
//  Bill.swift
//  SplitBill
//
//  Created by Sakura Rapolu on 7/17/18.
//  Copyright © 2018 Emmie Ohnuki. All rights reserved.
//

import Foundation

struct Bill {
    let tipPercent: Double
    let taxAmount: Double
    var allItems: [Item]
    let grandTotal: Double
    let grandSubtotal: Double
    var people: [Person]
    
    func calculate() {
        
    }
    
    
}

