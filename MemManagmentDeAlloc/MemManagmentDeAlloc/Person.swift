//
//  Person.swift
//  MemManagmentDeAlloc
//
//  Created by Phillip Carlino on 2017-11-11.
//  Copyright © 2017 Phillip Carlino. All rights reserved.
//

import Foundation

class Person: CustomStringConvertible {
    let name: String
    var assets = [Asset]()
    
    var description: String {
        return "Person(\(name)"
    }
    
    init(name: String) {
        self.name = name
    }
    
    deinit {
        print("\(self) is being deallocated")
    }
    
    func takeOwnership(of asset: Asset) {
        asset.owner = self
        assets.append(asset)
    }
}
