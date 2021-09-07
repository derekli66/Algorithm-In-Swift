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

/*
 Problem: https://leetcode.com/problems/palindrome-linked-list/
 **/

public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() { self.val = 0; self.next = nil; }
     public init(_ val: Int) { self.val = val; self.next = nil; }
     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}

class Solution {
    /*
        The palindrome is the string we can read form head or tail and the character sequences are matched
    
        1. Use two pointer and let one ptr be the center of linked list.
        2. Reverse the linked list in the range of center to tail.
        3. Then, compare of head and center step by step to do validation.
        
    **/
    
    func isPalindrome(_ head: ListNode?) -> Bool {
        if head == nil { return false }
        
        var fastPtr = head
        var slowPtr = head
        
        while (fastPtr != nil && fastPtr?.next != nil) {
            fastPtr = fastPtr?.next?.next
            slowPtr = slowPtr?.next
        }
        
        var trailingPtr = reversed(slowPtr)
        var headPtr = head
        
        while (trailingPtr != nil) {
            if trailingPtr?.val != headPtr?.val {
                return false
            }
            
            trailingPtr = trailingPtr?.next
            headPtr = headPtr?.next
        }
        
        return true
    }
    
    func reversed(_ head: ListNode?) -> ListNode? {
        var prev: ListNode? = nil
        var middle: ListNode? = nil
        var current = head
        
        while (current != nil) {
            prev = middle
            middle = current
            current = current?.next
            
            middle?.next = prev
        }
        
        return middle
    }
}
