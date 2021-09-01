
class Solution {
    func rob(_ nums: [Int]) -> Int {
        if nums.count == 1 {
            return nums[0]
        }
        
        if nums.count == 2 {
            return max(nums[0], nums[1])
        }
        
        var dp = [Int](repeating: 0, count: nums.count)
        dp[0] = nums[0]
        dp[1] = max(nums[0], nums[1])
        
        
        for idx in 2..<nums.count {
            dp[idx] = max(dp[idx - 1], dp[idx - 2] + nums[idx])
        }
        
        return dp[nums.count - 1]
    }
}

/**
 Input: nums = [1,2,3,1]
 Output: 4
 */

let nums = [1,2,3,1]
let result = Solution().rob(nums)
assert(result == 4)

/**
 Input: nums = [2,7,9,3,1]
 Output: 12
 */

let nums2 = [2,7,9,3,1]
let result2 = Solution().rob(nums2)
assert(result2 == 12)
