import XCTest
@testable import STACK

final class STACKTests: XCTestCase {
    func testInsert() {
        var stack = Stack<Int>()
        stack.insert(999)
        XCTAssert(stack.top! == 999)
        XCTAssert(stack.pop()! == 999)
        XCTAssert(stack.top == nil)
    }

    func testInsertAndPop() {
        var stack = Stack<Int>()
        for idx in 100..<1001 {
            stack.insert(idx)
            XCTAssert(stack.top! == idx)
        }

        for idx in (100..<1001).reversed() {
            XCTAssert(stack.pop()! == idx)
        }
    }

    func testCopyOnWrite() {
        var stack1 = Stack<Int>()
        stack1.insert(100)
        stack1.insert(200)
        stack1.insert(300)
        var stack2 = stack1
        XCTAssert(stack2.pop()! == 300)
        XCTAssert(stack2.top! == 200)
        XCTAssert(stack1.top! == 300)

        stack1.insert(400)
        stack2.insert(999)
        XCTAssert(stack1.top! == 400)
        XCTAssert(stack2.top! == 999)
    }

    static var allTests = [
        ("testInsert", testInsert),
        ("testInsertAndPop", testInsertAndPop),
        ("testCopyOnWrite", testCopyOnWrite)
    ]
}
