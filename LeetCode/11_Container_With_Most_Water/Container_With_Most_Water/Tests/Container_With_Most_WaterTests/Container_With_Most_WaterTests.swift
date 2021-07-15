    import XCTest
    @testable import Container_With_Most_Water

    final class Container_With_Most_WaterTests: XCTestCase {
        func testCase1() {
            let height = [1,8,6,2,5,4,8,3,7]
            let solution = Solution().maxArea(height)
            XCTAssertEqual(solution, 49)
        }
        
        func testCase2() {
            let height = [1,1]
            let solution = Solution().maxArea(height)
            XCTAssertEqual(solution, 1)
        }
        
        func testCase3() {
            let height = [4,3,2,1,4]
            let solution = Solution().maxArea(height)
            XCTAssertEqual(solution, 16)
        }
        
        func testCase4() {
            let height = [1,2,1]
            let solution = Solution().maxArea(height)
            XCTAssertEqual(solution, 2)
        }
    }
