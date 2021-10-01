class Solution {
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var numMap = [Int: Int]()
        
        for idx in 0..<nums.count {
            let num = nums[idx]
            let diff = target - num
            if numMap[diff] != nil {
                return [idx, numMap[diff]!]
            }
            else {
                numMap[num] = idx
            }
        }
        
        return []
    }
}
