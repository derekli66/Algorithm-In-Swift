import XCTest
@testable import Flood_Fill

final class Flood_FillTests: XCTestCase {
    func testcase1() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let image = [[1,1,1],[1,1,0],[1,0,1]]
        print("\(Solution().floodFill(image,1,1,2))")
    }
}
