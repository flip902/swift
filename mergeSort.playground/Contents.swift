import UIKit

func mergeSort(_ array: [Int]) -> [Int] {
    // If the array is empty or contains a single element return the array
    guard array.count > 1 else { return array }
    // Find the middle index
    let middleIndex = array.count / 2
    // Using the middle index from previous, recursively split left side array
    let leftArray = mergeSort(Array(array[0..<middleIndex]))
    // Also, recursively split the right side of array
    let rightArray = mergeSort(Array(array[middleIndex..<array.count]))
    // Finally, merge all the values together, making sure that it is sorted
    return merge(leftPile: leftArray, rightPile: rightArray)
}

func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
    // You need two indexes to keep track of your progress for the two arrays merging
    var leftIndex = 0
    var rightIndex = 0
    // This is the empty merged array, you build it up in steps appending elements from other arrays
    var orderedPile = [Int]()
    
    // This while-loop compares elements from left and right and appends to orderedPile
    while leftIndex < leftPile.count && rightIndex < rightPile.count {
        if leftPile[leftIndex] < rightPile[rightIndex] {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        } else if leftPile[leftIndex] > rightPile[rightIndex] {
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        } else {
            orderedPile.append(leftPile[leftIndex])
            rightIndex += 1
        }
    }
    // If control exits from the prvious loop, left or right pile has contents merged into orderedPile, so append the rest of whatever is in the other array until everything is appended
    while leftIndex < leftPile.count {
        orderedPile.append(leftPile[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < rightPile.count {
        orderedPile.append(rightPile[rightIndex])
        rightIndex += 1
    }
    
    return orderedPile
    
}

let array = [2, 1, 5, 4, 9]
print("unsorted array: \(array)")
var sortedArray = mergeSort(array)
print("sorted array: \(sortedArray)")



















