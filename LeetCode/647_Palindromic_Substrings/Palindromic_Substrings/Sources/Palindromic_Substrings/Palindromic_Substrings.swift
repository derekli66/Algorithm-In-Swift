class Solution {
    func countSubstrings(_ s: String) -> Int {
        let chars = Array(s)
        let length = s.count
        var dp = [[Int]](repeating: [Int](repeating: 0, count: length),
                         count: length)
        var count = 0

        for idx in 0..<length {
            dp[idx][idx] = 1
            count += 1
        }
        
        
        for len in 1..<length {
            for idx in 0..<length - len {
                if len == 1 && chars[idx] == chars[idx + len] {
                    dp[idx][idx + len] = 1
                    count += 1
                }
                else if chars[idx] == chars[idx + len] {
                    if dp[idx + 1][idx + len - 1] != 0 {
                      dp[idx][idx + len] = 1
                      count += 1
                    }
                }
            }
        }
        
        return count
    }
}
