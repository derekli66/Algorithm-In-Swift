import UIKit

let array = [11, 11, 12, 12, 100, 199, 5, 4 ,3 ,1, 2 ,6, 8 ,7, 9, 10]

func mergeSort(_ array: [Int]) -> [Int] {
    if (array.count == 1) { return array }
    
    let mid = array.count / 2
    
    //split array into half
    var leftSubarray = [Int]()
    for idx in 0..<mid {
        leftSubarray.append(array[idx])
    }
 
    var rightSubarray = [Int]()
    for idx in mid..<array.count {
        rightSubarray.append(array[idx])
    }
    
    // do merge sort
    let sortedLeft = mergeSort(leftSubarray)
    let sortedRight = mergeSort(rightSubarray)
    
    // do merge
    var outputArray = [Int]()
    var indexL = 0
    var indexR = 0
    while (indexL < sortedLeft.count && indexR < sortedRight.count) {
        if (sortedLeft[indexL] < sortedRight[indexR]) {
            outputArray.append(sortedLeft[indexL])
            indexL += 1
        }
        else {
            outputArray.append(sortedRight[indexR])
            indexR += 1
        }
    }
    
    // Append reset of elements
    if (indexL < sortedLeft.count) {
        for idx in indexL..<sortedLeft.count {
            outputArray.append(sortedLeft[idx])
        }
    }
    
    if (indexR < sortedRight.count) {
        for idx in indexR..<sortedRight.count {
            outputArray.append(sortedRight[idx])
        }
    }
    
    return outputArray
}

let sorted = mergeSort(array)
print("[Debug] Sorted array: \(sorted)")
