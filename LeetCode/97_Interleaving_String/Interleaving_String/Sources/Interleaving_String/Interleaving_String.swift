class Solution {
    func isInterleave(_ s1: String, _ s2: String, _ s3: String) -> Bool {
        if s1.count == 0 && s2.count == 0 && s3.count == 0 { return true }
        
        chars1 = Array(s1)
        chars2 = Array(s2)
        let chars3 = Array(s3)
        
        dp = Array(repeating: Array(repeating: nil, count: s2.count + 1), count: s1.count + 1)
        
        let result1 = compare(chars3, 0, chars1, 0, chars2, 0)
        let result2 = compare(chars3, 0, chars2, 0, chars1, 0)

        return result1 || result2
    }

    private var chars1 = [Character]()
    private var chars2 = [Character]()
    private var dp = [[Bool?]]()
    
    private func compare(_ s3: Array<Character>, _ idx3: Int,
                         _ s1: Array<Character>, _ idx1: Int,
                         _ s2: Array<Character>, _ idx2: Int) -> Bool {
        if idx1 == s1.count - 1 && idx3 == s3.count - 1 && s3[idx3] == s1[idx1] && idx2 == s2.count {
            return true
        }
        if idx1 == s1.count || idx3 == s3.count {
            return false
        }
        if s3[idx3] != s1[idx1] {
            return false
        }
        
        if s1 == chars1 && dp[idx1+1][idx2] != nil {
            return dp[idx1 + 1][idx2]!
        }
        if s1 == chars2 && dp[idx2][idx1+1] != nil {
            return dp[idx2][idx1+1]!
        }
        
        let result1 = compare(s3, idx3+1, s2, idx2, s1, idx1+1)
        let result2 = compare(s3, idx3+1, s1, idx1+1, s2, idx2)
        
        if s1 == chars1 {
            dp[idx1 + 1][idx2] = result1 || result2
        }
        if s1 == chars2 {
            dp[idx2][idx1+1] = result1 || result2
        }
                
        return result1 || result2
    }
}


