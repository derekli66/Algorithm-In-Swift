import XCTest
@testable import MINIMUM_STEP_IN_GRID

final class MINIMUM_STEP_IN_GRIDTests: XCTestCase {
    func testMinimumStep() {
        var testGrid = [[Int]]()

        for _ in 0..<3 {
            testGrid.append(Array(repeating: 1, count: 3))
        }

        let step = findMinStepsFrom(start: Point(row:0,column:0), toEnd: Point(row:1,column:1), inGrid: testGrid)
        print("Minimum steps is \(step)")
        XCTAssert(step == 3)
    }

    static var allTests = [
        ("testMinimumStep", testMinimumStep)
    ]
}
