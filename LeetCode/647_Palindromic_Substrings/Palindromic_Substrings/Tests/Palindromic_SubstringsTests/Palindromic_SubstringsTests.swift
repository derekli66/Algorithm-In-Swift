    import XCTest
    @testable import Palindromic_Substrings

    final class Palindromic_SubstringsTests: XCTestCase {
        func testSolution1() {
            let s = "aaa"
            let result = Solution().countSubstrings(s)
            XCTAssert(result == 6)
        }
    }
