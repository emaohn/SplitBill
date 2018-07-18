//
//  Bill.swift
//  SplitBill
//
//  Created by Sakura Rapolu on 7/18/18.
//  Copyright © 2018 Emmie Ohnuki. All rights reserved.
//

import Foundation

struct Bill {
        let tipPercent: Double = 0
        let taxAmount: Double = 0
        static var allItems: [Item] = []
        let grandTotal: Double = 0
        let grandSubtotal: Double = 0
        var people: [Person] = []
    
    init(){}
}
