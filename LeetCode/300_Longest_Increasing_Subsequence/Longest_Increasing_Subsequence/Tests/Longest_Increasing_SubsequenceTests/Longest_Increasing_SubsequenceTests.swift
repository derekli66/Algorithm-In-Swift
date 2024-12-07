    import XCTest
    @testable import Longest_Increasing_Subsequence

    final class Longest_Increasing_SubsequenceTests: XCTestCase {
        func testSolution1() {
            /**
             Input: nums = [10,9,2,5,3,7,101,18]
             Output: 4
             */
            
            let nums = [10,9,2,5,3,7,101,18]
            let result = Solution().lengthOfLIS(nums)
            XCTAssert(result == 4)
        }
        
        func testSolution2() {
            /**
             Input: nums = [1,2,3]
             Output: 3
             */
            let nums = [1,2,3]
            let result = Solution().lengthOfLIS(nums)
            XCTAssert(result == 3)
        }
        
        func testSolution3() {
            /**
             Input: nums = [0,1,0,3,2,3]
             Output: 4
             */
            let nums = [0,1,0,3,2,3]
            let result = Solution().lengthOfLIS(nums)
            XCTAssert(result == 4)
        }
    }
