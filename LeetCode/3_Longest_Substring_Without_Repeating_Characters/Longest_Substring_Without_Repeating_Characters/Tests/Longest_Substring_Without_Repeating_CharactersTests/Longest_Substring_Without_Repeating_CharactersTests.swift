    import XCTest
    @testable import Longest_Substring_Without_Repeating_Characters

    final class Longest_Substring_Without_Repeating_CharactersTests: XCTestCase {
        func testCase1() {
            /*
             "abba"
             Output
             3
             Expected
             2
             **/
            let str = "abba"
            let result = Solution().lengthOfLongestSubstring(str)
            XCTAssert(result == 2)
        }
        
        func testCase2() {
            /*
             "abcabcbb"
             Output
             4
             Expected
             3
             **/
            let str = "abcabcbb"
            let result = Solution().lengthOfLongestSubstring(str)
            XCTAssert(result == 3)
        }
    }
