    import XCTest
    @testable import Two_Sum

    final class Two_SumTests: XCTestCase {
        func testCase1() {
            /*
             [2,7,11,15]
             9
             [1,0]
             **/
            
            let nums = [2,7,11,15]
            let target = 9
            let result = Solution().twoSum(nums, target)
            let resultSet = Set(result)
            let answerSet = Set([1, 0])
            XCTAssert(resultSet == answerSet)
        }
        
        func testCase2() {
            /*
             Input: nums = [3,2,4], target = 6
             Output: [1,2]
             **/
            
            let nums = [3,2,4]
            let target = 6
            let result = Solution().twoSum(nums, target)
            let resultSet = Set(result)
            let answerSet = Set([1, 2])
            XCTAssert(resultSet == answerSet)
        }
    }
