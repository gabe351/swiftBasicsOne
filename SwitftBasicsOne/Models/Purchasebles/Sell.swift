//
//  Sell.swift
//  SwitftBasicsOne
//
//  Created by Gabriel Rosa on 07/04/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

class Sell: Purchasable {
        
    private let costumer: Costumer
    
    override var asJson: [String : Any] {
        get {
            return [JSONField.id: super.id,
                    JSONField.costumer: costumer,
                    JSONField.value: super.value,
                    JSONField.purchaseType: super.purchaseType,
                    JSONField.produtct:     super.product,
                    JSONField.tag: super.tag]
        }
    }
        
    init(
         id: Int,
         costumer: Costumer,
         value: Float,
         purchaseType: PurchaseType,
         product: Product,
         tag: String) throws {
        
        self.costumer = costumer
        
        try super.init(id: id,
                       value: value,
                       purchaseType: purchaseType,
                       product: product,
                       tag: tag)
    }
    
    convenience init(_ json: [String : Any]) throws {
        try self.init(id:           json[JSONField.id] as! Int,
                      costumer:     json[JSONField.costumer] as! Costumer,
                      value:        json[JSONField.value] as! Float,
                      purchaseType: json[JSONField.purchaseType] as! PurchaseType,
                      product:      json[JSONField.produtct] as! Product,
                      tag:          json[JSONField.tag] as! String)
    }
    
    func getCostumer() -> Costumer {
        return costumer
    }
}
