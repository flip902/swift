//
//  Zombie.swift
//  MonsterTown
//
//  Created by Phillip Carlino on 2017-11-02.
//  Copyright © 2017 Phillip Carlino. All rights reserved.
//

import Foundation

class Zombie: Monster {
    var walksWithLimp: Bool
    private(set) var isFallingApart: Bool
    
    init(limp: Bool, fallingApart: Bool, town: Town?, monsterName: String) {
        walksWithLimp = limp
        isFallingApart = fallingApart
        super.init(town: town, monsterName: monsterName)
    }
    
    convenience init(limp: Bool, fallingApart: Bool) {
        self.init(limp: limp, fallingApart: fallingApart, town: nil, monsterName: "Billy")
        if walksWithLimp {
            print("This Zombie has a bad knee.")
        }
    }
    
    required init(town: Town?, monsterName: String) {
        walksWithLimp = false
        isFallingApart = false
        super.init(town: town, monsterName: monsterName)
    }
    
    deinit {
        print("Zombie named \(name) is no longer with us.")
    }
    
    override class var spookyNoise: String {
        return "Brains..."
    }
    
    final override func terrorizeTown() {
        if !isFallingApart {
            town?.changePopulation(by: -10)
        }
        super.terrorizeTown()
    }
    
}
