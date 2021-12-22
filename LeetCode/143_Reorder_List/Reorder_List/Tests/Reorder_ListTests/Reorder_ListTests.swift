import XCTest
@testable import Reorder_List

final class Reorder_ListTests: XCTestCase {
    private func outputNodeValues(_ head: ListNode?) -> [Int] {
        var values = [Int]()
        var current = head
        
        while current != nil {
            values.append(current!.val)
            current = current?.next
        }
        
        return values
    }
    
    func testReorderList() throws {
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        let node4 = ListNode(4)
        
        node1.next = node2
        node2.next = node3
        node3.next = node4
        
        let originValues = outputNodeValues(node1)
        
        Solution().reorderList(node1)
        
        let reorderedValues = outputNodeValues(node1)
        
        print("Origin values: \(originValues)")
        print("Reordered values: \(reorderedValues)")
        
        XCTAssert(reorderedValues.elementsEqual([1,4,2,3]))
    }
    
    func testReorderList2() throws {
        let node1 = ListNode(1)
        let node2 = ListNode(2)
        let node3 = ListNode(3)
        let node4 = ListNode(4)
        let node5 = ListNode(5)
        
        node1.next = node2
        node2.next = node3
        node3.next = node4
        node4.next = node5
        
        let originValues = outputNodeValues(node1)
        
        Solution().reorderList(node1)
        
        let reorderedValues = outputNodeValues(node1)
        
        print("Origin values: \(originValues)")
        print("Reordered values: \(reorderedValues)")
        
        XCTAssert(reorderedValues.elementsEqual([1,5,2,4,3]))
    }
    
}
