//: Playground - noun: a place where people can play

import UIKit
import Foundation







class List<T> {
    var value: T
    var nextItem: List<T>?
    
    convenience init?(_ values: T...) {
        self.init(Array(values))
    }
    
    init?(_ values: [T]) {
        guard let first = values.first else {
            return nil
        }
        value = first
        nextItem = List(Array(values.suffix(from: 1)))
    }
}








// P01: Find the last element of a linked list
extension List {
//    var last: T {
//        guard let element = self.nextItem else {
//            return self.value
//        }
//        return element.last
//    }
    
    public var last: T {
        return nextItem?.last ?? value
    }
}
List(1, 1, 2, 3, 5, 8)!.last


// P02: Find the last but one element of a linked list
extension List {
    var pennultimate: T? {
        guard let next = self.nextItem else { return nil }
        if next.nextItem == nil { return value }
        return next.pennultimate
    }
}
List(1, 1, 2, 3, 5, 8)?.pennultimate

// P03: Find the Nth element of a linked list


//extension List {
//    subscript(index: Int) -> T? {
//        var list = self
//        for _ in 0..<index {
//            if list.nextItem == nil {
//                return nil
//            }
//            list = list.nextItem!
//        }
//        return list.value
//    }
//}

extension List {
    public subscript(index: Int) -> T? {
        guard index >= 0 else { return nil }
        return (index == 0) ? value : nextItem?[index-1]
    }
}
let list = List(1, 1, 2, 3, 5, 8)!
list[4]



// P04: Find the number of elements of a linked list
extension List {
    var length: Int {
        var count = 1
        var current = self
        while let next = current.nextItem {
            count += 1
            current = next
        }
        return count
    }
}
list.length


// P05: Reverse a linked list
extension List {
    public func reverse() -> List {
        let head = self
        let tail = self.nextItem
        head.nextItem = nil
        return reversing(head: head, tail: tail)
    }
    
    private func reversing(head: List, tail: List?) -> List {
        guard let tail = tail else { return head }
        let newTail = tail.nextItem
        let newHead = tail
        newHead.nextItem = head
        return reversing(head: newHead, tail: newTail)
    }
}

let reversedList = list.reverse()
print(String(describing: reversedList))














