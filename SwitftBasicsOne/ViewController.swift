//
//  ViewController.swift
//  SwitftBasicsOne
//
//  Created by Gabriel Rosa on 07/04/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        do {
            
            let a = try! Sell(id: 1,
                             costumer: Costumer(id: 1, name: "", tags: [""]),
                             value: 3.0,
                             purchaseType: .unique,
                             product: Product(id: 1, description: "", tags: [""]),
                             tag: "")
            
            let b = try! Purchase(id: 1,
                                  value: 1.3,
                                  purchaseType: .recurring,
                                  product: Product(id: 1, description: "", tags: [""]),
                                  tag: "")
            
        } catch ErrorsEnum.invalidObject {
            print("Error")
        }
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

