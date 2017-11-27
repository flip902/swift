func sortedEvenOddNumbers(_ numbers: [Int]) -> (evens: [Int], odds: [Int]) {
  var evens = [Int]()
  var odds = [Int]()
  for number in numbers {
    if number % 2 == 0 {
      evens.append(number)
    } else {
      odds.append(number)
    }
  }
  return (evens, odds)
}

let aBunchOfNumbers = [10, 1, 4, 3, 57, 43, 84, 27, 156, 111]
let sortedNumbers = sortedEvenOddNumbers(aBunchOfNumbers)
print("The even numbers are: \(sortedNumbers.evens); the odd numbers are: \(sortedNumbers.odds)")
