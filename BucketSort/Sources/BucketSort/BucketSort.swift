import Foundation

class Solution {
    private class Node {
        var val: Int
        var next: Node?

        init(_ value: Int) {
            self.val = value
        }
    }

    static func bucketSort(_ array: inout [Int]) {
        if array.count == 0 { return }
        // 1. Find the largest number in the array
        // Use largest and smallest variable to get possible range of input elements
        // This will solve issue if input elements are smaller than ZERO
        var largest = array[0]
        var smallest = array[0]
        for val in array {
            if val > largest {
                largest = val   
            }

            if val < smallest {
                smallest = val
            }
        }

        // 2. Create bucket(Node) array with the largest number
        var bucketArray = [Node?](repeating: nil, count: largest - smallest + 1)

        // 3. Iterate input array and then insert number into bucket array
        // Let smallest variable to be the base value to calculate the array index
        for val in array {
            let idx = val - smallest
            insert(index: idx, value: val, buckets: &bucketArray)
        }

        // 4. Retreive all elements from bucket array and fill into input array 
        var idx = 0
        for var node in bucketArray where node != nil {
            while nil != node {
                let val = node!.val
                array[idx] = val
                idx += 1
                node = node?.next
            }
        }
    }

    static private func insert(index: Int, value: Int, buckets: inout [Node?]) {
        if let node = buckets[index] {
            let newNode = Node(value)
            newNode.next = node
            buckets[index] = newNode
        } else {
            let node = Node(value)
            buckets[index] = node
        }
    }
}
