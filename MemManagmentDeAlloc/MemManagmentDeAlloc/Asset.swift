//
//  Asset.swift
//  MemManagmentDeAlloc
//
//  Created by Phillip Carlino on 2017-11-11.
//  Copyright © 2017 Phillip Carlino. All rights reserved.
//

import Foundation

class Asset: CustomStringConvertible {
    let name: String
    let value: Double
    var owner: Person?
    
    var description: String {
        if let actualOwner = owner {
            return "Asset(\(name), worth \(value), owned by  \(actualOwner))"
        } else {
            return "Asset(\(name), worth \(value), not owned by anyone)"
        }
    }
    
    init(name: String, value: Double) {
        self.name = name
        self.value = value
    }
    
    deinit {
        print("\(self) is being deallocated")
    }
}
