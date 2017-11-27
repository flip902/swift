func binarySearch<T: Comparable>(_ a: [T], key: T, range: Range<Int>) -> Int? {
    if range.lowerBound >= range.upperBound {
      // If we end up here, key is not in array
      return nil
    } else {
        // Calculate where to split the array
        let midIndex = range.lowerBound + (range.upperBound - range.lowerBound) / 2
        
        // Is the search key in the left half?
        if a[midIndex] > key {
          return binarySearch(a, key: key, range: range.lowerBound ..< midIndex)
        } else if a[midIndex] < key {
            return binarySearch(a, key: key, range: midIndex + 1 ..< range.upperBound)
            
            // If we get here we've found the key!
        } else {
            return midIndex
        }
    }
}
let numbers = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67]

var result = binarySearch(numbers, key: 43, range: 0 ..< numbers.count)
print(result!)
