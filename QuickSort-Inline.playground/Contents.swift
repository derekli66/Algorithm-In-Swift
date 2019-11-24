import UIKit

/*
 Quick Sort Inline
 */

var array = [5, 3, 2 , 4, 1, 1, 9, 7, 6, 10, 8]

func quick(_ array: inout [Int]) {
    quick(&array, 0, array.count - 1)
}

func quick(_ array: inout [Int], _ startIndex: Int, _ endIndex: Int) {
    if (endIndex <= startIndex) { return }
    
    let mid = (startIndex + endIndex) / 2
    let pivot = array[mid]
    
    var leftIdx = startIndex
    var rightIdx = endIndex
    
    while leftIdx <= rightIdx {
        while array[leftIdx] < pivot {
            leftIdx += 1
        }
        while array[rightIdx] > pivot {
            rightIdx -= 1
        }
        
        if leftIdx <= rightIdx {
            array.swapAt(leftIdx, rightIdx)
            leftIdx += 1
            rightIdx -= 1
        }
    }
    
    quick(&array, startIndex, rightIdx)
    quick(&array, leftIdx, endIndex)
}

quick(&array)
print("[Debug] \(array)")
