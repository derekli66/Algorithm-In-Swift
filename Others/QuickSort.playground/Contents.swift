import UIKit

/*
 Quick Sort
 1. Pick a pivot
 2. Compare with pivot
 3. Separate the array into 2 half. One of halves contains elements are samller than pivot and the other one has all elements greater than pivot.
 4. Recursive doing this on the 2 halves.
 */

let unsortedArray = [10, 5, 4, 1, 2 ,3, 7, 9, 6, 8]

func quick(_ array: [Int]) -> [Int] {
    if (1 == array.count || 0 == array.count) { return array }
    
    let mid = array.count / 2
    let pivot = array[mid]
    
    // Separate the array into 2 halves
    var firstHalf = Array<Int>()
    for idx in 0..<array.count {
        if (idx != mid && array[idx] <= pivot) {
            firstHalf.append(array[idx])
        }
    }
    
    var secondHalf = Array<Int>()
    for idx in 0..<array.count {
        if (idx != mid && array[idx] > pivot) {
            secondHalf.append(array[idx])
        }
    }
    
    var result = Array<Int>()
    let sorted1 = quick(firstHalf)
    let sorted2 = quick(secondHalf)
    result.append(contentsOf: sorted1)
    result.append(pivot)
    result.append(contentsOf: sorted2)
    
    return result
}

let sorted = quick(unsortedArray)

print("[Debug] The sorted array: \(sorted)")
