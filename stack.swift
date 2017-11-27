public struct Stack<T> {
  fileprivate var array = [T]()

  public var count: Int {
    return array.count
  }

  public var isEmpty: Bool {
    return array.isEmpty
  }

  public mutating func push(_ element: T) {
    array.append(element)
  }

  public mutating func pop() -> T? {
    return array.popLast()
  }

  public var top: T? {
    return array.last
  }
}

// Create a stack and put some elements on it already.
var stackOfNames = Stack(array: ["Billy", "Sarah", "Jada", "Brayden", "Brooklyn"])

// Add an element to the top of the stack.
stackOfNames.push("Rachel")

// The stack is now ["Billy", "Sarah", "Jada", "Brayden", "Brooklyn", "Rachel"]
print(stackOfNames.array)

// Remove and return the first element from the stack. This returns "Rachel".
stackOfNames.pop()
print(stackOfNames.array)
// Look at the first element from the stack.
// Returns "Brooklyn" since "Rachel" was popped on the previous line.
print(stackOfNames.top)

// Check to see if the stack is empty.
// Returns "false" since the stack still has elements in it.
stackOfNames.isEmpty
