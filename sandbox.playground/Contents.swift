//: Playground - noun: a place where people can play

import UIKit

//let str = "My String"
//
//let encoder = JSONEncoder()
//let jsonData = try! encoder.encode([str])
//
//String(bytes: jsonData, encoding: .utf8)
//
//let decoder = JSONDecoder()
//try! decoder.decode([String].self, from: jsonData)

let dict = [
    "people": 24,
    "cars": 6,
    "cats": 18
]

let encoder = JSONEncoder()
let encoded = try! encoder.encode(dict)
let encodedDict = String(bytes: encoded, encoding: .utf8)
print(encodedDict!)

let decoder = JSONDecoder()
// TODO



