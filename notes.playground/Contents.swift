//: Playground - noun: a place where people can play

import UIKit
import Foundation

var board = [[String]](repeating: [String](repeating: "", count: 10), count: 10)
print(board)


// Using Sets
let scores = [5, 3, 6, 1, 3, 5, 3, 9]
let scoreSet = Set(scores)
let uniqueScoresArray = Array(scoreSet)

// Allocate minimum capacity
var capacityDictionary = Dictionary<String, String>(minimumCapacity: 100)
var capacityArray = [String]()
capacityArray.reserveCapacity(100)

// Enums
enum myColor: Int {
    case unknown, blue, green, pink, purple, red
}

struct Toy {
    let name: String
    let color: myColor
}

let barbie = Toy(name: "Barbie", color: .pink)
let raceCar = Toy(name: "Lighting McQueen", color: .red)

enum Planet: Int {
    case mercury = 1
    case venus
    case earth
    case mars
    case unknown
}
let marsNumber = Planet.mars.rawValue
let mars = Planet(rawValue: 556) ?? Planet.unknown

// Arrays using sort and sorted p.103
var names = ["Taylor", "Timothy", "Tyler", "Thomas", "Tobias", "Tabitha"]
let numbers = [5, 3, 1, 9, 5, 2, 7, 8]

let sorted = names.sorted()

names.sort {
    print("Comparing \($0) and \($1)")
    if ($0 == "Taylor") {
        return true
    } else if $1 == "Taylor" {
        return false
    } else {
        return $0 < $1
    }
}

let lowest = numbers.min()
let highest = numbers.max()

// Using Comparable protocol
struct Dog: Comparable {
    var breed: String
    var age: Int
    
    static func <(lhs: Dog, rhs: Dog) -> Bool {
        return lhs.age < rhs.age
    }

    static func ==(lhs: Dog, rhs: Dog) -> Bool {
        return lhs.age == rhs.age
    }
}

let razor = Dog(breed: "Pitbull", age: 7)
let punchie = Dog(breed: "Bull Mastiff", age: 4)
let rover = Dog(breed: "Goldern Retreiver", age: 2)
var dogs = [razor, punchie, rover]

dogs.sort()

// use popLast() instead of removeLast() if you think the array might be empty
if let dog = dogs.popLast() {
    print(dog)
}



// Dictionaries
let cities = ["Shanghai": 24_256_800, "Karachi": 23_500_000, "Beijing": 21_516_000, "Seoul": 9_995_000];
let roundedCities = cities.mapValues { "\($0 / 1_000_000) million people" }
print(roundedCities)

let groupedCities = Dictionary(grouping: cities.keys) { $0.first! }
print(groupedCities)

let cityStringLength = Dictionary(grouping: cities.keys) { $0.count }
print(cityStringLength)

// Sets
var set1 = Set<Int>([1, 2, 3, 4, 5])
var set2 = Set(1...100)

set1.insert(6)
set1.insert(7)
if set1.contains(3) {
    print("Number 3 is here")
}
set1.remove(3)

let spaceships1 = Set(["Serenity", "Nostromo", "Enterprise"])
let spaceships2 = Set(["Voyager", "Serenity", "Executor"])

let union = spaceships1.union(spaceships2) // adds set together (no duplicates)
let intersection = spaceships1.intersection(spaceships2) // returns duplicates
let difference = spaceships1.symmetricDifference(spaceships2) // returns differences
// add form to all these methods for inline

let spaceships1and2 = spaceships1.union(spaceships2)

// A.isSubset(of: B): returns true if all of set A's items are also in set A.
spaceships1.isSubset(of: spaceships1and2)
spaceships1.isSubset(of: spaceships2)
// A.isSuperset(of: B): returns true if all of set B's items are also in set A.
spaceships1and2.isSuperset(of: spaceships2)
// A.isDisjoint(with: B): returns true if none of set B's items are also in set A.
spaceships1and2.isDisjoint(with: spaceships2)
// A.isStrictSubset(of: B): returns true if all of set A's items are also in set B, but A and B are not equal.
spaceships1.isSubset(of: spaceships1and2)
// A.isStrictSuperset(of: B): returns true if all of set B's items are also in set A, but A and B are not equal
spaceships1and2.isStrictSuperset(of: spaceships1)






















