    import XCTest
    @testable import Longest_Palindromic_Substring

    final class Longest_Palindromic_SubstringTests: XCTestCase {
        func testCase1() {
            /*
             # Input: s = "babad"
             # Output: "bab"
             */
            let solution = Solution()
            let str = "babad"
            XCTAssert("bab" == solution.longestPalindrome(str))
        }
        
        func testCase2() {
            /*
             # Input:
             # "cbbd"
             # Output:
             # "bb"
             */
            let solution = Solution()
            let str = "cbbd"
            XCTAssert("bb" == solution.longestPalindrome(str))
        }
    }
