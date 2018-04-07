//
//  Product.swift
//  SwitftBasicsOne
//
//  Created by Gabriel Rosa on 07/04/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class Product {
    var id: Int {
        get {
            return self.id
        }
        set{}
    }
    
    var description: String {
        get {
            return self.description
        }
        set{}
    }
    
    var tags: [String] {
        get {
            return self.tags
        }
        set{}
    }
    
    init(id: Int,
         description: String,
         tags: [String]) {
        
        self.id          = id
        self.description = description
        self.tags        = tags
    }
}
