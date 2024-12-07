    import XCTest
    @testable import Reverse_Integer

    final class Reverse_IntegerTests: XCTestCase {
        func testCase1() {
            /*
             1534236469
             Output
             9646324351
             Expected
             0
             **/
            
            let x = 1534236469
            let result = Solution().reverse(x)
            print("[TEST] Result: \(result)")
            XCTAssert(result == 0)
        }
    }
