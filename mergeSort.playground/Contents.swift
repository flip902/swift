import UIKit

func mergeSort(_ array: [Int]) -> [Int] {
    // If the array is empty or contains a single element return the array
    guard let array.count > 1 else { return array }
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
    
    // This is the empty merged array, you build it up in steps appending elements from other arrays
    
    
    // This while-loop compares elements from left and right and appends to orderedPile
    
    // If control exits from the prvious loop, left or right pile has contents merged into orderedPile, so append the rest of whatever is in the other array until everything is appended
    
    
   
    
}





















