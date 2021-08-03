    import XCTest
    @testable import Maximum_Sum_of_Two_Non_Overlapping_Subarrays

    final class Maximum_Sum_of_Two_Non_Overlapping_SubarraysTests: XCTestCase {
        func testSolution1() {
            /**
             Input: nums = [0,6,5,2,2,5,1,9,4], firstLen = 1, secondLen = 2
             Output: 20
             */
            
            let nums = [0,6,5,2,2,5,1,9,4]
            let firstLen = 1
            let secondLen = 2
            
            let maxSum = Solution().maxSumTwoNoOverlap(nums, firstLen, secondLen)
            XCTAssert(maxSum == 20)
        }
        
        func testSolution2() {
            /**
             Input: nums = [3,8,1,3,2,1,8,9,0], firstLen = 3, secondLen = 2
             Output: 29
             */
            
            let nums = [3,8,1,3,2,1,8,9,0]
            let firstLen = 3
            let secondLen = 2
            
            let maxSum = Solution().maxSumTwoNoOverlap(nums, firstLen, secondLen)
            XCTAssert(maxSum == 29)
        }
        
        func testSolution3() {
            /**
             Input: nums = [2,1,5,6,0,9,5,0,3,8], firstLen = 4, secondLen = 3
             Output: 31
             */
            
            let nums = [2,1,5,6,0,9,5,0,3,8]
            let firstLen = 4
            let secondLen = 3
            
            let maxSum = Solution().maxSumTwoNoOverlap(nums, firstLen, secondLen)
            XCTAssert(maxSum == 31)
        }
        
        func testSolution4() {
            /**
             Input: nums = [1,0,3], firstLen = 1, secondLen = 2
             Output: 4
             */
            
            let nums = [1, 0, 3]
            let firstLen = 1
            let secondLen = 2
            
            let maxSum = Solution().maxSumTwoNoOverlap(nums, firstLen, secondLen)
            XCTAssert(maxSum == 4)
        }
    }
