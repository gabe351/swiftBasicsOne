//
//  Costumer.swift
//  SwitftBasicsOne
//
//  Created by Gabriel Rosa on 07/04/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class Costumer {
    
    private let id: Int
    private let name: String
    private let tags: [String]
    
    init(id: Int,
         name: String,
         tags: [String]) {
        
        self.id   = id
        self.name = name
        self.tags = tags
    }
    
}
