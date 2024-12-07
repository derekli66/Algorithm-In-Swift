import XCTest
@testable import Perfect_Squares

final class Perfect_SquaresTests: XCTestCase {
    func testCase1() throws {
        /*
         Input: n = 12
         Output: 3
         Explanation: 12 = 4 + 4 + 4.
         **/
        
        let n = 12
        let result = Solution().numSquares(n)
        XCTAssert(result == 3)
    }
}
