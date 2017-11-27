//
//  main.swift
//  MemManagmentDeAlloc
//
//  Created by Phillip Carlino on 2017-11-11.
//  Copyright © 2017 Phillip Carlino. All rights reserved.
//

// At this point the assets are not being deallocated fix this problem with weak var owner: Person?
// p.324 ch 24 Big Nerd Ranch
import Foundation

var billy: Person? = Person(name: "Billy")
print("crated \(String(describing: billy))")

var laptop: Asset? = Asset(name: "Shiny Laptop", value: 1_500.0)
var hat: Asset? = Asset(name: "Cowboy Hat", value: 175.0)
var backpack: Asset? = Asset(name: "Black Backpack", value: 45.0)

billy?.takeOwnership(of: laptop!)
billy?.takeOwnership(of: hat!)

billy = nil
print("the billy variable is now \(String(describing: billy))")

laptop = nil
hat = nil
backpack = nil



