    import XCTest
    @testable import Longest_Palindromic_Subsequence

    final class Longest_Palindromic_SubsequenceTests: XCTestCase {
        func testSolution1() {
            let s = "bbbab"
            
            let result = Solution().longestPalindromeSubseq(s)
            XCTAssert(result == 4)
        }
        
        func testSolution2() {
            let s = "cbbd"
            
            let result = Solution().longestPalindromeSubseq(s)
            XCTAssert(result == 2)
        }
        
        func testSolution3() {
            let s = "aaa"
            
            let result = Solution().longestPalindromeSubseq(s)
            XCTAssert(result == 3)
        }
    }
    
    /*
     Example 1:

     Input: s = "bbbab"
     Output: 4
     Explanation: One possible longest palindromic subsequence is "bbbb".
     
     
     Example 2:

     Input: s = "cbbd"
     Output: 2
     Explanation: One possible longest palindromic subsequence is "bb".
     */
