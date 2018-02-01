//: Playground - noun: a place where people can play

import UIKit



class Human {
    var name: String
    var age: Int
    var favoriteIceCream: String
    
    
    init(name: String, age: Int, favoriteIceCream: String) {
        self.name = name
        self.age = age
        self.favoriteIceCream = favoriteIceCream
    }
}

let taytay = Human(name: "Taylor Swift", age: 26, favoriteIceCream: "Chocolate")

let taylor = taytay

taytay.name = "Billy"
print(taytay.name)
print(taylor.name)

taylor.name = "Fred"
taytay.name



struct Person {
    var name: String
    var age: Int
    var favoriteIceCream: String
}

var justin = Person(name: "Justin Beiber", age: 24, favoriteIceCream: "Vanilla")

let beibs = justin

justin.name = "Fred"
print(justin.name)
print(beibs.name)














