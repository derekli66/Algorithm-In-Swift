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
        
        func testSolution2() {
            /**
             Input: amount = 3, coins = [2]
             Output: 0
             Explanation: the amount of 3 cannot be made up just with coins of 2.
             */
            let amount = 3
            let coins = [2]
            
            let theWay = Solution().change(amount, coins)
            print("[DEBUG] the way \(theWay)")
            XCTAssert(theWay == 0)
        }
        
        func testSolution3() {
            /**
             Input: amount = 10, coins = [10]
             Output: 1
             */
            let amount = 10
            let coins = [10]
            
            let theWay = Solution().change(amount, coins)
            print("[DEBUG] the way \(theWay)")
            XCTAssert(theWay == 1)
        }
    }
