import XCTest
@testable import IntertionSort

final class IntertionSortTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(IntertionSort().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
