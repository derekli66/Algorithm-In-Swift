import XCTest
@testable import QUEUE

final class QUEUETests: XCTestCase {
    func testEnqueue() {
        var queue = Queue<Int>()
        queue.enqueue(999)
        XCTAssert(queue.first! == 999)
        XCTAssert(queue.dequeue()! == 999)
        XCTAssert(queue.first == nil)
    }

    static var allTests = [
        ("testEnqueue", testEnqueue)
    ]
}
