import XCTest
@testable import BinaryTreeSuccessor

final class BinaryTreeSuccessorTests: XCTestCase {
    func testSuccessor() {
        let node1 = Node(1)
        let node2 = Node(2)
        let node3 = Node(3)
        let node4 = Node(4)
        let node5 = Node(5)
        let node6 = Node(6)
        let node7 = Node(7)

        node4.left = node2
        node2.parent = node4
        node4.right = node5
        node5.parent = node4

        node2.left = node1
        node1.parent = node2
        node2.right = node3
        node3.parent = node2

        node5.left = node6
        node6.parent = node5
        node5.right = node7
        node7.parent = node5

        var successorNode = successor(node3)
        XCTAssert(successorNode != nil)
        debugPrint("[Debug] \(successorNode!.key)")
        XCTAssert(successorNode!.key == node4.key)

        successorNode = successor(node1)
        XCTAssert(successorNode != nil)
        debugPrint("[Debug] \(successorNode!.key)")
        XCTAssert(successorNode!.key == node2.key)

        successorNode = successor(node6)
        XCTAssert(successorNode != nil)
        debugPrint("[Debug] \(successorNode!.key)")
        XCTAssert(successorNode!.key == node5.key)

        successorNode = successor(node7)
        XCTAssert(successorNode == nil)

        successorNode = successor(node4)
        XCTAssert(successorNode != nil)
        debugPrint("[Debug] \(successorNode!.key)")
        XCTAssert(successorNode!.key == node5.key)

        successorNode = successor(node2)
        XCTAssert(successorNode != nil)
        debugPrint("[Debug] \(successorNode!.key)")
        XCTAssert(successorNode!.key == node3.key)
    }

    static var allTests = [
        ("testSuccessor", testSuccessor)
    ]
}
