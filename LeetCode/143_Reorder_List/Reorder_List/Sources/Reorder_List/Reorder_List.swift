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

public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }

class Solution {
    
    private var currentHead: ListNode? = nil
    func reorderList(_ head: ListNode?) {
        /*
         1. Find middle node
         2. Do recursive traversal to the last node
         3. Connect the last node with current head node
         4. Move current head node to the next node of last head node
         5. Mark next node of the last current head node to be nil
         **/
        
        let middleNode = findMiddleNode(head)
        currentHead = head
        
        recursiveReorder(middleNode?.next)
        
        currentHead?.next = nil
    }
    
    private func recursiveReorder(_ currentLast: ListNode?) {
        if currentLast?.next == nil {
            let tempNode = currentHead?.next
            currentHead?.next = currentLast
            currentLast?.next = tempNode
            currentHead = tempNode
            return
        }
        
        recursiveReorder(currentLast?.next)
        
        let tempNode = currentHead?.next
        currentHead?.next = currentLast
        currentLast?.next = tempNode
        currentHead = tempNode
    }
    
    private func findMiddleNode(_ head: ListNode?) -> ListNode? {
        
        var fast = head
        var slow = head
        while fast?.next != nil && fast?.next?.next != nil {
            slow = slow?.next
            fast = fast?.next?.next
        }
        
        return slow
    }
}
