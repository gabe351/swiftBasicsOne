//
//  Purchaseble.swift
//  SwitftBasicsOne
//
//  Created by Gabriel Rosa on 07/04/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

public class Purchasable {
    
    let id: Int
    let value: Float
    let purchaseType: PurchaseType
    let product: Product
    let tag: String
    
    var asJson: [String: Any] {
        get {
            return [JSONField.id: id,
                    JSONField.value: value,
                    JSONField.purchaseType: purchaseType,
                    JSONField.produtct:  product,
                    JSONField.tag: tag]
        }
    }
    
    init(id: Int,
         value: Float,
         purchaseType: PurchaseType,
         product: Product,
         tag: String) throws {
        
        if id < 0 {
            throw ErrorsEnum.invalidID
        }
        
        if tag.isEmpty {
            throw ErrorsEnum.invalidTag
        }
        
        self.id           = id
        self.value        = value
        self.purchaseType = purchaseType
        self.product      = product
        self.tag          = tag
    }
    
    convenience init(_ json: [String : Any]) throws {
        try self.init(id:           json[JSONField.id] as! Int,
                      value:        json[JSONField.value] as! Float,
                      purchaseType: json[JSONField.purchaseType] as! PurchaseType,
                      product:      json[JSONField.produtct] as! Product,
                      tag:          json[JSONField.tag] as! String)
    }
            
    func getId() -> Int {
        return id
    }
    
    func getValue() -> Float {
        return value
    }
    
    func getPurchaseType() -> PurchaseType {
        return purchaseType
    }
    
    func getProduct() -> Product {
        return product
    }
    
    func getTag() -> String {
        return tag
    }
}
