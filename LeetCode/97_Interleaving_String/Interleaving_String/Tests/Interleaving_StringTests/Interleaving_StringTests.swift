    import XCTest
    @testable import Interleaving_String

    final class Interleaving_StringTests: XCTestCase {
        func testCase1() {
            /*
             Input:
             "aa"
             "ab"
             "abaa"
             Output:
             false
             Expected:
             true
             **/
            let s1 = "aa"
            let s2 = "ab"
            let s3 = "abaa"
            let result = Solution().isInterleave(s1,s2,s3)
            XCTAssert(result == true)
        }
        
        func testCase2() {
            /*
             Input:
             "aa"
             "ab"
             "abaa"
             Output:
             false
             Expected:
             true
             **/
            let s1 = "ac"
            let s2 = "bd"
            let s3 = "abcd"
            let result = Solution().isInterleave(s1,s2,s3)
            XCTAssert(result == true)
        }
        
        func testCase3() {
            /*
             "cbcccbabbccbbcccbbbcabbbabcababbbbbbaccaccbabbaacbaabbbc"
             "abcbbcaababccacbaaaccbabaabbaaabcbababbcccbbabbbcbbb"
             "abcbcccbacbbbbccbcbcacacbbbbacabbbabbcacbcaabcbaaacbcbbbabbbaacacbbaaaabccbcbaabbbaaabbcccbcbabababbbcbbbcbb"
             **/
            let s1 = "cbcccbabbccbbcccbbbcabbbabcababbbbbbaccaccbabbaacbaabbbc"
            let s2 = "abcbbcaababccacbaaaccbabaabbaaabcbababbcccbbabbbcbbb"
            let s3 = "abcbcccbacbbbbccbcbcacacbbbbacabbbabbcacbcaabcbaaacbcbbbabbbaacacbbaaaabccbcbaabbbaaabbcccbcbabababbbcbbbcbb"
            let result = Solution().isInterleave(s1,s2,s3)
            XCTAssert(result == true)
        }
        
        func testCase4() {
            /*
             "aabcc"
             "dbbca"
             "aadbbcbcac"
             **/
            let s1 = "aabcc"
            let s2 = "dbbca"
            let s3 = "aadbbcbcac"
            let result = Solution().isInterleave(s1,s2,s3)
            XCTAssert(result == true)
        }
    }
