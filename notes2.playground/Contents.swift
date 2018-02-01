//: Playground - noun: a place where people can play

import UIKit
import Foundation

//NSCountedSet
var spaceships = ["Serenity", "Nostromo", "Enterpise"]
spaceships += ["Voyager", "Serenity", "Star Destroyer"]
spaceships += ["Galactica", "Sulaco", "Minbari"]
// note: NSCountedSet does not support generics
let countedSet = NSCountedSet(array: spaceships)
print(countedSet.count(for: "Serenity"))



var singer = (first: "Tayler", last: "Swift", sing: { (lyrics: String) in
    print("\(lyrics)")
})
singer.sing("Haters gonna hate")

func fetchWeather() -> (type: String, cloudCover: Int, high: Int, low: Int) {
    return ("Sunny", 50, 32, 26)
}

let weather = fetchWeather()
print(weather.low)

let (types, cloud, high, low) = fetchWeather()

// Optional Tuples
let optionalElements: (String?, String?) = ("Taylor", nil)
let optionalTuple: (String, String)? = ("Taylor", "Swift")
let optionalBoth: (String?, String?)? = (nil, "Swift")

// Comparing tuples
let star = (first: "Taylor", last: "Swift")
let person = (first: "Justin", last: "Bieber")

if star == person {
    print("Match!")
} else {
    print("No match")
}

// ignores tuple labels
let favSinger = (first: "Taylor", last: "Swift")
let bird = (name: "Taylor", breed: "Swift")

if favSinger == bird {
    print("Match!")
} else {
    print("No Match :(")
}


let father = (first: "Scott", last: "Swift")
let mother = (first: "Andrea", last: "Finlay")
// Not a very good looking function right here let's try something different
func marryTaylorsParents(man: (first: String, last: String), woman: (first: String, last: String)) -> (husband: (first: String, last: String), wife: (first: String, last: String)) {
    return (man, (woman.first, man.last))
}

marryTaylorsParents(man: father, woman: mother)
print(marryTaylorsParents(man: father, woman: mother))

// Use a typealias
typealias Name = (first: String, last: String)
func marryTaylorsParentsAgain(man: Name, woman: Name) -> (husband: Name, wife: Name) {
    return (man, (woman.first, woman.last))
}
print(marryTaylorsParentsAgain(man: father, woman: mother))

// Generics
// Redundant functions
func inspectString(_ value: String) {
    print("Received String with the value \(value)")
}
inspectString("Haters gonna hate")

func inspectInt(_ value: Int) {
    print("Received Int with the value \(value)")
}
inspectInt(42)

// Generic type
func inspect<T>(_ value: T) {
    print("Received \(type(of: value)) with the value \(value)")
}

inspect("Haters gonna hate")
inspect(56)
inspect(56.6)

func square<T: Numeric>(_ value: T) -> T {
    return value * value
}
square(42)
square(42.556)



struct deque<T> {
    
    var array = [T]()
    
    mutating func pushBack(_ obj: T) {
        array.append(obj)
    }
    
    mutating func pushFront(_ obj: T) {
        array.insert(obj, at: 0)
    }
    
    mutating func popBack() -> T? {
        return array.popLast()
    }
    
    mutating func popFront() -> T? {
        if array.isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
}
var testDeque = deque<Int>()
testDeque.pushBack(5)
testDeque.pushFront(2)
// 2, 5
testDeque.pushFront(1)
// 1, 2, 5
testDeque.popBack() // 5



struct CustomCountedSet<T: Any> {
    
    let internalSet = NSCountedSet()
    
    mutating func add(_ obj: T) {
        internalSet.add(obj)
    }
    
    mutating func remove(_ obj: T) {
        internalSet.remove(obj)
    }
    
    func count(for obj: T) -> Int {
        return internalSet.count(for: obj)
    }
}

var countedS = CustomCountedSet<String>()
countedS.add("Hello")
countedS.add("World")
countedS.count(for: "World")
countedS.remove("World")
countedS.count(for: "World")















































































