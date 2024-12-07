class Solution {
    func lengthOfLIS(_ nums: [Int]) -> Int {
        let size = nums.count
        var dp = [[Int]](repeating: [Int](repeating: -1, count: size),
                         count: size)
        
        for idx in 0..<nums.count {
            dp[idx][idx] = 1
        }
        
        for len in 1..<size {
            var idx = 0
            while idx < size - len {
                if len == 1 && nums[idx] < nums[idx + len] {
                    dp[idx][idx + len] = 2
                }
                else if nums[idx] < nums[idx + len] {
                    dp[idx][idx + len] = dp[idx + 1][idx + len - 1] + 1
                }
                else {
                    dp[idx][idx + len] = max(dp[idx][idx + len - 1], dp[idx + 1][idx + len])
                }
                
                idx += 1
            }
        }
        
        return dp[0][size - 1]
    }
}
