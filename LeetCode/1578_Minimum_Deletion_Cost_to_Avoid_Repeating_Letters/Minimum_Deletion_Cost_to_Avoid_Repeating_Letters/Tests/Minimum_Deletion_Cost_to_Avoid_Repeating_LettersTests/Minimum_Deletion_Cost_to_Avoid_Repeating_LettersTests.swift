    import XCTest
    @testable import Minimum_Deletion_Cost_to_Avoid_Repeating_Letters

    final class Minimum_Deletion_Cost_to_Avoid_Repeating_LettersTests: XCTestCase {
        func testCase1() {
            /*
             Input: s = "abaac", cost = [1,2,3,4,5]
             Output: 3
             **/
            let s = "abaac"
            let cost = [1,2,3,4,5]
            XCTAssert(Solution().minCost(s, cost) == 3)
        }
        
        func testCase2() {
            /*
             Input: s = "abc", cost = [1,2,3]
             Output: 0
             **/
            
            let s = "abc"
            let cost = [1,2,3]
            XCTAssert(Solution().minCost(s, cost) == 0)
        }
        
        func testCase3() {
            /*
             Input: s = "aabaa", cost = [1,2,3,4,1]
             Output: 2
             **/
            
            let s = "aabaa"
            let cost = [1,2,3,4,1]
            XCTAssert(Solution().minCost(s, cost) == 2)
        }
        
        func testCase4() {
            /*
             Input:
             "aaabbbabbbb"
             [3,5,10,7,5,3,5,5,4,8,1]
             Output:
             25
             Expected:
             26
             **/
            
            let s = "aaabbbabbbb"
            let cost = [3,5,10,7,5,3,5,5,4,8,1]
            XCTAssert(Solution().minCost(s, cost) == 26)
        }
    }
