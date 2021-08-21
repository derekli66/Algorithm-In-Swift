class Solution2 {
    func maxRotateFunction(_ nums: [Int]) -> Int {
            var totalSum = 0
            var currentResult = 0
            var maxResult = 0
            let length = nums.count
            
            for idx in 0..<length {
                totalSum += nums[idx]
                currentResult += idx * nums[idx]
            }
            
            maxResult = currentResult
            
            for k in 1..<length {
                currentResult = currentResult + totalSum - length * nums[length - k]
                
                if maxResult < currentResult {
                    maxResult = currentResult
                }
            }
            
            return maxResult
        }
}
