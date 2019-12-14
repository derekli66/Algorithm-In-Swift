import XCTest
@testable import DEQUE

final class DEQUETests: XCTestCase {
   func testInsertBack() {
        var deque = Deque<Int>()
        deque.insertBack(100)
        deque.insertBack(200)
        deque.insertBack(300)
        deque.insertBack(400)
        XCTAssert(deque.first! == 100)
        XCTAssert(deque.last! == 400)
    }

    func testListNodeCopy() {
        let node1 = ListNode(10)
        let node2 = ListNode(20)
        let node3 = ListNode(30)

        node1.next = node2
        node2.parent = node1
        XCTAssert(node2.parent! === node1)
        XCTAssert(node2.next == nil)

        node2.next = node3
        node3.parent = node2
        XCTAssert(node3.parent! === node2)
        XCTAssert(node3.next == nil)

        let node3Copy = node3.copy()
        XCTAssert(node3Copy.val == node3.val)
        XCTAssert(node3Copy.parent! === node2)
        XCTAssert(node3Copy.next == nil)

        let node2Copy = node2.copy()
        XCTAssert(node2Copy.val == node2.val)
        XCTAssert(node2Copy !== node2)
        XCTAssert(node2Copy.parent! === node1)
        XCTAssert(node2Copy.next != nil)
        XCTAssert(node2Copy.next!.val == node2.next!.val)
        XCTAssert(node2Copy.next! !== node2.next!)
    }

    func testInsertFirstValueAtBack() {
        var deque = Deque<Int>()
        deque.insertBack(100)
        XCTAssert(deque.first! == 100)
        XCTAssert(deque.last! == 100)
    }

    func testInsertFirstValueAtFront() {
        var deque = Deque<Int>()
        deque.insertFront(100)
        XCTAssert(deque.first! == 100)
        XCTAssert(deque.last! == 100)
    }

    func testPopBack() {
        var deque = Deque<Int>()
        deque.insertBack(100)
        deque.insertBack(200)
        deque.insertBack(300)
        deque.insertBack(400)
        XCTAssert(deque.popBack()! == 400)
        XCTAssert(deque.last! == 300)

        XCTAssert(deque.popBack()! == 300)
        XCTAssert(deque.last! == 200)

        XCTAssert(deque.popBack()! == 200)
        XCTAssert(deque.last! == 100)

        XCTAssert(deque.popBack()! == 100)
        XCTAssert(deque.last == nil)
        XCTAssert(deque.first == nil)
    }

    func testInsertFront() {
        var deque = Deque<Int>()
        deque.insertFront(100)
        deque.insertFront(200)
        deque.insertFront(300)
        deque.insertFront(400)
        XCTAssert(deque.first! == 400)
        XCTAssert(deque.last! == 100)
    }

    func testPopFront() {
        var deque = Deque<Int>()
        deque.insertFront(100)
        deque.insertFront(200)
        deque.insertFront(300)
        deque.insertFront(400)

        XCTAssert(deque.popFront()! == 400)
        XCTAssert(deque.first! == 300)

        XCTAssert(deque.popFront()! == 300)
        XCTAssert(deque.first! == 200)

        XCTAssert(deque.popFront()! == 200)
        XCTAssert(deque.first! == 100)

        XCTAssert(deque.popFront()! == 100)
        XCTAssert(deque.first == nil)
        XCTAssert(deque.last == nil)
    }

    func testStructUnique() {
        var deque1 = Deque<Int>()
        deque1.insertBack(100)

        var deque2 = deque1
        deque2.insertBack(500)

        var deque3 = deque2
        deque3.insertBack(600)

        var deque4 = deque3
        deque4.insertFront(50)

        var deque5 = deque4
        deque5.popFront()
        XCTAssert(deque5.first! == 100)
        XCTAssert(deque5.last! == 600)
        deque5.popBack()
        XCTAssert(deque5.first! == 100)
        XCTAssert(deque5.last! == 500)
        deque5.popBack()
        XCTAssert(deque5.first! == 100)
        XCTAssert(deque5.last! == 100)
        deque5.popBack()
        XCTAssert(deque5.last == nil)
        XCTAssert(deque5.first == nil)

        XCTAssert(deque4.first! == 50)
        XCTAssert(deque4.last! == 600)
        XCTAssert(deque3.first! == 100)
        XCTAssert(deque3.last! == 600)
        XCTAssert(deque2.first! == 100)
        XCTAssert(deque2.last! == 500)
        XCTAssert(deque1.first! == 100)
        XCTAssert(deque1.last! == 100)
    }

    static var allTests = [
        ("testListNodeCopy", testListNodeCopy),
        ("testInsertFirstValueAtBack", testInsertFirstValueAtBack),
        ("testInsertFirstValueAtFront", testInsertFirstValueAtFront),
        ("testInsertFront", testInsertFront),
        ("testPopBack", testPopBack),
        ("testPopFront", testPopFront),
        ("testStructUnique", testStructUnique),
        ("testInsertBack", testInsertBack)
    ]
}
