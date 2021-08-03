class Solution {
    private func rangeSum(of sumArray: [Int], _ leadIndex: Int, window: Int) -> Int {
        if leadIndex >= sumArray.count { return 0 }
        if window == 0 { return sumArray[leadIndex] }
        
        let headingSum = sumArray[leadIndex]
        let trailingSum = (leadIndex - window >= 0 ) ? sumArray[leadIndex - window] : 0
        
        return headingSum - trailingSum
    }
    
    private func maxSum(of sumArray: [Int], _ startIndex: Int, _ endIndex: Int, window: Int) -> Int {
        if startIndex < 0 { return 0 }
        if endIndex >= sumArray.count { return 0 }
        if startIndex > endIndex { return 0}
        
        if startIndex == endIndex && window == 1 {
            let previousIdx = startIndex - 1
            let lastSum = (previousIdx >= 0) ? sumArray[previousIdx] : 0
            return sumArray[startIndex] - lastSum
        }
        if startIndex + window > endIndex { return 0 }

        var startIdx = startIndex - 1
        var maxResult = 0
        while startIdx + window <= endIndex {
            let currentSum = sumArray[startIdx + window] - sumArray[startIdx]
            maxResult = max(maxResult, currentSum)
            startIdx += 1
        }
        
        return maxResult
    }
    
    private func sumArray(from nums: [Int]) -> [Int] {
        var sumArray = nums
        var idx = 0
        
        var currentSum = 0
        while idx < sumArray.count {
            currentSum += nums[idx]
            sumArray[idx] = currentSum
            idx += 1
        }
        
        return sumArray
    }
    
    func maxSumTwoNoOverlap(_ nums: [Int], _ firstLen: Int, _ secondLen: Int) -> Int {
        let maxLen = max(firstLen, secondLen)
        let minLen = min(firstLen, secondLen)
        let sumArr = sumArray(from: nums)
        
        var leadingIdx = maxLen - 1
        var maxResult = 0
        while leadingIdx < sumArr.count {
            let middleSum = rangeSum(of: sumArr, leadingIdx, window: maxLen)
            let trailingMaxSum = maxSum(of: sumArr, leadingIdx + 1, sumArr.count - 1, window: minLen)
            let headingMaxSum = maxSum(of: sumArr, leadingIdx - maxLen - minLen + 1, leadingIdx - maxLen, window: minLen)
            
            maxResult = max(maxResult, middleSum + max(trailingMaxSum, headingMaxSum))
            
            leadingIdx += 1
        }
        
        return maxResult
    }
}
