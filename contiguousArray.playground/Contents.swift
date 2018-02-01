//: Playground - noun: a place where people can play

import UIKit
// ContiguousArrays are stored next to each other in memory and quicker to access
let array1 = Array<Int>(1...1000000)
let array2 = ContiguousArray<Int>(1...1000000)

// Time it takes to reduce a normal array of 1 - 1000000
var start = CFAbsoluteTimeGetCurrent()
array1.reduce(0, +)
var end = CFAbsoluteTimeGetCurrent() - start
print("Took \(end) seconds")

// Time it takes to reduce a ContiguousArray of 1 - 1000000
start = CFAbsoluteTimeGetCurrent()
array2.reduce(0, +)
end = CFAbsoluteTimeGetCurrent() - start
print("Took \(end) seconds")


