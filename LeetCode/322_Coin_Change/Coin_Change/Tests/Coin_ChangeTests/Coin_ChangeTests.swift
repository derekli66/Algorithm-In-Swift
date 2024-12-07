import XCTest
@testable import Coin_Change

final class Coin_ChangeTests: XCTestCase {
    func testCase1() throws {
        /*
         array = [1, 2]
         amount = 3
         result = 2
         **/
        
        let coins = [1, 2]
        let amount = 3
        let minimum = Solution().coinChange(coins, amount)
        XCTAssert(minimum == 2)
    }
}
