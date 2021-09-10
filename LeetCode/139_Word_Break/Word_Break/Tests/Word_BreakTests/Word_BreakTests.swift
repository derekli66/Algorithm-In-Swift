    import XCTest
    @testable import Word_Break

    final class Word_BreakTests: XCTestCase {
        func testExample1() {
            /*
             Input: s = "leetcode", wordDict = ["leet","code"]
             Output: true
             Explanation: Return true because "leetcode" can be segmented as "leet code".
             **/
            
            let s = "leetcode"
            let wordDict = ["leet", "code"]
            let result = Solution().wordBreak(s, wordDict)
            XCTAssert(result == true)
        }
        
        func testExample2() {
            /*
             Input: s = "applepenapple", wordDict = ["apple","pen"]
             Output: true
             Explanation: Return true because "applepenapple" can be segmented as "apple pen apple".
             Note that you are allowed to reuse a dictionary word.
             **/
            
            let s = "applepenapple"
            let wordDict = ["apple","pen"]
            let result = Solution().wordBreak(s, wordDict)
            XCTAssert(result == true)
        }
        
        func testExample3() {
            /*
             Input: s = "catsandog", wordDict = ["cats","dog","sand","and","cat"]
             Output: false
             **/
            
            let s = "catsandog"
            let wordDict = ["cats","dog","sand","and","cat"]
            let result = Solution().wordBreak(s, wordDict)
            XCTAssert(result == false)
        }
        
        func testExample4() {
            /*
             Time Limit Exceeded Case
             "acaaaaabbbdbcccdcdaadcdccacbcccabbbbcdaaaaaadb"
             ["abbcbda","cbdaaa","b","dadaaad","dccbbbc","dccadd","ccbdbc","bbca","bacbcdd","a","bacb","cbc","adc","c","cbdbcad","cdbab","db","abbcdbd","bcb","bbdab","aa","bcadb","bacbcb","ca","dbdabdb","ccd","acbb","bdc","acbccd","d","cccdcda","dcbd","cbccacd","ac","cca","aaddc","dccac","ccdc","bbbbcda","ba","adbcadb","dca","abd","bdbb","ddadbad","badb","ab","aaaaa","acba","abbb"]
             **/
            
            let s = "acaaaaabbbdbcccdcdaadcdccacbcccabbbbcdaaaaaadb"
            let wordDict = ["abbcbda","cbdaaa","b","dadaaad","dccbbbc","dccadd","ccbdbc","bbca","bacbcdd","a","bacb","cbc","adc","c","cbdbcad","cdbab","db","abbcdbd","bcb","bbdab","aa","bcadb","bacbcb","ca","dbdabdb","ccd","acbb","bdc","acbccd","d","cccdcda","dcbd","cbccacd","ac","cca","aaddc","dccac","ccdc","bbbbcda","ba","adbcadb","dca","abd","bdbb","ddadbad","badb","ab","aaaaa","acba","abbb"]
            let result = Solution().wordBreak(s, wordDict)
            XCTAssert(result == true)
        }
        
        func testExample5() {
            /*
             Time Limit Exceeded Case
             "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab"
             ["a","aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa"]
             **/
            
            let s = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab"
            let wordDict = ["a","aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa"]
            let result = Solution().wordBreak(s, wordDict)
            XCTAssert(result == true)
        }
    }
