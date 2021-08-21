    import XCTest
    @testable import Rotate_Function

    final class Rotate_FunctionTests: XCTestCase {
        func testSolution1() {
            /**
             Input: nums = [4,3,2,6]
             Output: 26
             */
            
            let nums = [4,3,2,6]
            let result = Solution2().maxRotateFunction(nums)
            XCTAssert(result == 26)
        }
        
        func testSolution2() {
            /**
             Input: nums = [100]
             Output: 0
             */
            
            let nums = [100]
            let result = Solution2().maxRotateFunction(nums)
            XCTAssert(result == 0)
        }
    }
