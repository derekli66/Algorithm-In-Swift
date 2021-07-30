    import XCTest
    @testable import Coin_Change_2

    final class Coin_Change_2Tests: XCTestCase {
        func testSolution1() {
            /**
             Input: amount = 5, coins = [1,2,5]
             Output: 4
             Explanation: there are four ways to make up the amount:
             5=5
             5=2+2+1
             5=2+1+1+1
             5=1+1+1+1+1
             */
            
            let amount = 5
            let coins = [1, 2, 5]
            let theWay = Solution().change(amount, coins)
            print("[DEBUG] the way \(theWay)")
            XCTAssert(theWay == 4)
        }
    }
