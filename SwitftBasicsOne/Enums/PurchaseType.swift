//
//  PurchaseType.swift
//  SwitftBasicsOne
//
//  Created by Gabriel Rosa on 07/04/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

enum PurchaseType: Int {
    
    case recurring = 0
    case unique    = 1
    
    func getStringBy(value: PurchaseType) -> String {
        switch value {
        case .recurring:
            return "Recurring purchase"
        case .unique:
            return "Unique purchase"
        }
    }
    
    func isUnique(_ value: PurchaseType) -> Bool {
        return value == .unique
    }
}
