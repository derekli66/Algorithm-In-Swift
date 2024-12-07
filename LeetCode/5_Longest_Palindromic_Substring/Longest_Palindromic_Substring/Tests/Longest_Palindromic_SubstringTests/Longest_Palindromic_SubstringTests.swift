    import XCTest
    @testable import Longest_Palindromic_Substring

    final class Longest_Palindromic_SubstringTests: XCTestCase {
        func testCase1() {
            /*
             # Input: s = "babad"
             # Output: "bab"
             */
            let solution = Solution2()
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
            let solution = Solution2()
            let str = "cbbd"
            let result = solution.longestPalindrome(str)
            XCTAssert("bb" == result)
        }
        
        func testCase3() {
            /*
             let s = "ac"
             **/
            let solution = Solution2()
            let str = "ac"
            let result = solution.longestPalindrome(str)
            XCTAssert("a" == result)
        }
        
        func testCase4() {
            /*
             Input
             "aacabdkacaa"
             Output
             "cabdkacaa"
             Expected
             "aca"
             **/
            let solution = Solution2()
            let str = "aacabdkacaa"
            let result = solution.longestPalindrome(str)
            XCTAssert("aca" == result)
        }
        
        func testCase5() {
            /*
            Input
            "cbbd"
            Output
            "c"
            Expected
            "bb"
            */
            let solution = Solution2()
            let str = "cbbd"
            let result = solution.longestPalindrome(str)
            XCTAssert("bb" == result)
        }
        
        func testCase6() {
            /*
            Input
            "caba"
            Output
            "c"
            Expected
            "aba"
            */
            let solution = Solution2()
            let str = "caba"
            let result = solution.longestPalindrome(str)
            XCTAssert("aba" == result)
        }
    }
