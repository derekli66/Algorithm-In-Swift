/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class ListNode {
    var val: Int = 0
    var next: ListNode? = nil
    init(_ val: Int) {
        self.val = val
    }
}

class Solution {
    /*
        1. keep tracking tail node and also mark the origin tail node
        2. iterate each node and move even nodes to the end of linked list
        3. check if the total count of nodes is even. If it is true, move origin tail node to the end of linked list.
    **/
    
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        var position = 1
        var tailNode: ListNode? = head
        var endNode: ListNode? = head
        var count: Int = 0
        
        // Find tail node and mark it
        while tailNode != nil {
            endNode = tailNode
            count += 1
            tailNode = tailNode?.next
        }
        
        tailNode = endNode
        
        var prePtr: ListNode? = nil
        var headPtr = head
        while headPtr !== endNode {
            if position % 2 == 0 {
                // Move node to the tail
                prePtr?.next = headPtr?.next
                headPtr?.next = nil
                tailNode?.next = headPtr
                tailNode = tailNode?.next
                headPtr = prePtr?.next
            }
            else {
                prePtr = headPtr
                headPtr = headPtr?.next
            }
            
            position += 1
        }
        
        if count % 2 == 0 {
            // Find the node before endNode
            var lastNode = head
            while lastNode?.next !== endNode {
                lastNode = lastNode?.next
            }
            
            lastNode?.next = endNode?.next
            endNode?.next = nil
            tailNode?.next = endNode
        }
        
        return head
    }
}
