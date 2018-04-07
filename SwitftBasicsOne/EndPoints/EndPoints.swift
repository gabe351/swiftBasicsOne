//
//  EndPoints.swift
//  SwitftBasicsOne
//
//  Created by Gabriel Rosa on 07/04/18.
//  Copyright © 2018 Gabe. All rights reserved.
//

import Foundation

public let projectPath = ConfigurationManager.BasePath.project.path
public let health = Health()

public class EndPoints {
    let router = Router()
    let cloudEnv = CloudEnv()
    var compras: [Int:Shopping] = [:]
    var indice = 1
    
    public init() throws {
        router.all(middleware: BodyParser())
        // Run the metrics initializer
        initializeMetrics(router: router)
    }
    
    func imprimir<T>(_ oQue : T) {
        print("\(oQue)")
    }
    
    func postInit() throws {
        // Endpoints
        initializeHealthRoutes(app: self)
        
        // Handle HTTP GET requests to /
        router.get("/") {
            request, response, next in
            response.send("Hello, World!")
            next()
        }
        
        router.post("/compra") { // Create
            request, response, next in
            if let data = request.body?.asJSON {
                let shopping = Shopping(json: data)
                let chave = self.indice
                self.indice += 1
                shopping.id = chave
                self.compras[chave] = shopping
                response.send(JSON(shopping).description)
            }
            next()
        }
        
        router.get("/compra") { // Read all
            request, response, next in
            var result: [Any] = []
            for valor in self.compras.values {
                result.append(valor)
            }
            response.send(JSON(result).description)
            next()
        }
        
        router.get("/addCompra") { // Read all
            request, response, next in
            let shopping = Shopping(id: 0, product: Product(id:1, name:"Biscoito"), quantity: 1, value: 5.5, date: Date(), type: ShoppingType.debit.rawValue)
            let chave = self.indice
            self.indice += 1
            shopping.id = chave
            self.compras[chave] = shopping
            response.send("OK")
            next()
        }
        
        router.get("/compra/:id") { // Read
            request, response, next in
            if let chaveStr = request.parameters["id"],
                let chave = Int(chaveStr),
                let data = self.compras[chave] {
                response.send(JSON(data).description)
            }
            next()
        }
        
        router.put("/compra/:id") { // Update
            request, response, next in
            if let chaveStr = request.parameters["id"],
                let chave = Int(chaveStr),
                let data = request.body?.asJSON {
                let compra = Shopping(json: data)
                self.compras[chave] = compra
                compra.id = chave
                response.send(JSON(compra).description)
            }
            next()
        }
        
        router.delete("/compra/:id") { // Delete
            request, response, next in
            if let chaveStr = request.parameters["id"],
                let chave = Int(chaveStr),
                let data = self.compras[chave] {
                self.compras[chave] = nil
                response.send(JSON(data).description)
            }
            next()
        }
    }
    
    public func run() throws {
        try postInit()
        Kitura.addHTTPServer(onPort: cloudEnv.port, with: router)
        Kitura.run()
    }
}
