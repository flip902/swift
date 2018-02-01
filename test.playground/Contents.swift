//: Playground - noun: a place where people can play

import UIKit

// generate an array of views
var aBunch = 5
let views = (1...aBunch)
    .map({ _ in UIView() })

// generate 5 random numbers 1 - 10 in an array
let randomNumberGenerator = { Int(arc4random_uniform(11)) }
let randomNumbers = Array(AnyIterator(randomNumberGenerator)
    .prefix(5))
// you can then use this code to generate 5 labels
let labels = Array(AnyIterator({ UILabel() }).prefix(5))

