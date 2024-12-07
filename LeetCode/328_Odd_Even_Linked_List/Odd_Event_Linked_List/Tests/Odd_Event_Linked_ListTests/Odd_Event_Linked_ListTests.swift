    import XCTest
    @testable import Odd_Event_Linked_List

    final class Odd_Event_Linked_ListTests: XCTestCase {
        func verify(_ head: ListNode?, anwser: [Int]) -> Bool {
            var headPtr = head
            var index: Int = 0
            
            while headPtr != nil {
                if headPtr?.val != anwser[index] {
                    return false
                }
                headPtr = headPtr?.next
                index += 1
            }
            
            return true
        }
        
        func testCase1() {
            let node1 = ListNode(1)
            let node2 = ListNode(2)
            let node3 = ListNode(3)
            let node4 = ListNode(4)
            let node5 = ListNode(5)
            
            node1.next = node2
            node2.next = node3
            node3.next = node4
            node4.next = node5
            
            let result = Solution().oddEvenList(node1)
            XCTAssert(verify(result, anwser: [1, 3, 5, 2, 4]))
        }
        
        func testCase2() {
            /*
             [1,2,3,4,5,6,7,8]
             **/
            
            let node1 = ListNode(1)
            let node2 = ListNode(2)
            let node3 = ListNode(3)
            let node4 = ListNode(4)
            let node5 = ListNode(5)
            let node6 = ListNode(6)
            let node7 = ListNode(7)
            let node8 = ListNode(8)
            
            node1.next = node2
            node2.next = node3
            node3.next = node4
            node4.next = node5
            node5.next = node6
            node6.next = node7
            node7.next = node8
            
            let result = Solution().oddEvenList(node1)
            XCTAssert(verify(result, anwser: [1, 3, 5, 7, 2 ,4, 6, 8]))
        }
    }
