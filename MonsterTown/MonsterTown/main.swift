//
//  main.swift
//  MonsterTown
//
//  Created by Phillip Carlino on 2017-11-01.
//  Copyright © 2017 Phillip Carlino. All rights reserved.
//

import Foundation

var myTown = Town(region: "North", population: 100_000, stopLights: 4)
let myTownSize = myTown?.townSize
print(myTownSize!)
myTown?.changePopulation(by: 500)
print(myTown?.population as Any)
var billyTheZombie: Zombie? = Zombie(limp: false, fallingApart: false, town: myTown, monsterName: "Billy")
billyTheZombie?.town = myTown
billyTheZombie?.terrorizeTown()
billyTheZombie?.town?.printDescription()

var convenientZombie = Zombie(limp: true, fallingApart: false)

print("Victim pool: \(billyTheZombie!.victimPool)")
billyTheZombie?.victimPool = 500
print("Victim pool: \(billyTheZombie!.victimPool)")
print(Zombie.spookyNoise)
if Zombie.isTerrifying {
    print("Run away!")
}
billyTheZombie = nil



