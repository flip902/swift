 /// Generators
protocol GeneratorType {
    associatedtype Element
    mutating func next() -> Element?
}

class ConstantGenerator: GeneratorType {
    typealias Element = Int?
    func next() -> Element? {
        return 1
    }
}

class FibsGenerator: GeneratorType {
    var state = (0, 1)
    func next() -> Int? {
        let upcomingNumber = state.0
        state = (state.1, state.0 + state.1)
        return upcomingNumber
    }
}

class PrefixGenerator: GeneratorType {
    let string: String
    var offset: String.Index

    init(string: String) {
        self.string = string
        offset = string.startIndex
    }

    func next() -> String? {
        guard offset < string.endIndex else { return nil }
        offset = string.index(after: offset)
        return String(string[string.startIndex..<offset])

    }
}

//let pg = PrefixGenerator(string: "Billy")
//pg.next()
//pg.next()
//pg.next()
//pg.next()
//pg.next()
//pg.next()

protocol SequenceType {
    associatedtype Generator: GeneratorType
    func generate() -> Generator
}

struct PrefixSequence: SequenceType {
    let string: String
    func generate() -> PrefixGenerator {
        return PrefixGenerator(string: string)
    }
}

func fibGenerator() -> AnyIterator<Int> {
    var state = (0, 1)
    return AnyIterator {
        let result = state.0
        state = (state.1, state.0 + state.1)
        return result
    }
}

var generator = PrefixSequence(string: "Hello").generate()
while let prefix = generator.next() {
    print(prefix)
}



/// A type that can `enqueue` and `dequeue` elements
protocol QueueType {
    /// The type of elements held `self`
    associatedtype Element
    /// Enqueue `newElement` to `self`
    mutating func enqueue(element: Element)
    /// Dequeue an element from `self`
    mutating func dequeue() -> Element?
}

/// An efficient variable-size FIFO queue of elements of type `Element`
struct Queue<Element>: QueueType {
    private var left: [Element]
    private var right: [Element]

    init() {
        left = []
        right = []
    }

    /// Add an element to the back of the queue in O(1)
    mutating func enqueue(element: Element) {
        right.append(element)
    }

    /// Removes front of the queue in amortized O(1)
    /// Returns nil in case of an empty queue
    mutating func dequeue() -> Element? {
        guard !(left.isEmpty && right.isEmpty) else { return nil }

        if left.isEmpty {
            left = right.reversed()
            right.removeAll(keepingCapacity: true)
        }

        return left.removeLast()
    }
}

extension Queue: Collection {
    func index(after i: Int) -> Int {
       return i + 1
    }

    var startIndex: Int { return 0 }
    var endIndex: Int { return left.count + right.count }

    subscript(idx: Int) -> Element {
        precondition((0..<endIndex).contains(idx), "Index out of bounds")
        if idx < left.endIndex {
            return left[left.count - idx.advanced(by: 1)]
        } else {
            return right[idx - left.count]
        }
    }
}

extension Queue: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        self.left = elements.reversed()
        self.right = []
    }
}

extension Queue: RangeReplaceableCollection {
    mutating func reserveCapacity(_ n: Int) {
        return
    }
    
    mutating func replaceRange<C: Collection>(subRange: Range<Int>, with newElements: C) where C.Iterator.Element == Element {
        right = left.reversed() + right
        left.removeAll(keepingCapacity: true)
        right.replaceSubrange(subRange, with: newElements)
    }
}


/// A Simple linked list enum
enum List<Element> {
    case End
    indirect case Node(Element, next: List<Element>)
}

extension List {
    func cons(x: Element) -> List {
        return .Node(x, next: self)
    }
}

let l = List<Int>.End.cons(x: 1).cons(x: 2).cons(x: 3)







/// A LIFO stac type with constant-time push and pop operations
protocol StackType {
    /// The type of element held stored int the stack
    associatedtype Element
    
    /// Pushes x onto the top of self
    /// Complexity: Amortized O(1)
    mutating func push(x: Element)
    
    /// Removes the topmost element of self and return it or nil if self is empty
    /// Complexity: O(1)
    mutating func pop() -> Element?
}

extension Array: StackType {
    mutating func push(x: Element) {
        append(x)
    }
    
    mutating func pop() -> Element? {
        return popLast()
    }
}

extension List: StackType {
    mutating func push(x: Element) {
        self = self.cons(x: x)
    }
    
    mutating func pop() -> Element? {
        switch self {
        case .End: return nil
        case let .Node(x, next: xs):
            self = xs
            return x
        }
    }
}



var stack = List<Int>.End.cons(x: 1).cons(x: 2).cons(x: 3)
var a = stack
var b = stack

a.pop()
a.pop()
a.pop()

stack.pop()
stack.push(x: 4)

b.pop()
b.pop()
b.pop()

stack.pop()
stack.pop()
stack.pop()
