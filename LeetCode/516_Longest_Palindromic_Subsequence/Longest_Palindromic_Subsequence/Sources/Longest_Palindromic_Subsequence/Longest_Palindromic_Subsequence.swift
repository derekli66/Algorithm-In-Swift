class Solution {
    func longestPalindromeSubseq(_ s: String) -> Int {
        let chars = Array(s)
        let length = s.count
        
        var dp = [[Int]](repeating: [Int](repeating: 0, count: length),
                         count: length)
        
        for idx in 0..<length {
            dp[idx][idx] = 1
        }
        
        for len in 1..<length {
            for idx in 0..<length - len {
                let j = idx+len
                if len == 1 && chars[idx] == chars[j] {
                    dp[idx][j] = 2
                }
                else if chars[idx] == chars[j] {
                    dp[idx][j] = dp[idx+1][j - 1] + 2
                }
                else {
                    dp[idx][j] = max(dp[idx][j - 1], dp[idx+1][j])
                }
            }
        }
        
        return dp[0][length - 1]
    }
}
