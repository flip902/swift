//: Playground - noun: a place where people can play

import UIKit

var numbers = [Int]()
for i in 1...100 {
    numbers.append(i)
}

for num in numbers {
    
    switch (num % 3, num % 5) {
    case (0, 0):
        print("\(num) FizzBuzz")
    case (_, 0):
        print("\(num) Buzz")
    case (0, _):
        print("\(num) Fizz")
    default:
        print(num)
    }
}
