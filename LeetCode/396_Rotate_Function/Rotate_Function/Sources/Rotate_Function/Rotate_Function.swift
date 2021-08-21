class Solution {
    private func makeCoefficient(_ index: Int, _ startIndex: Int, _ size: Int) -> Int {
        return (index + size - startIndex) % size
    }
    
    private func multipleFrom(startIndex: Int, nums: [Int]) -> Int {
        let size = nums.count
        var sum = 0
        
        for current in 0..<size {
            let idx = (startIndex + current) % size
            let coefficient = makeCoefficient(idx, startIndex, size)
            sum += coefficient * nums[idx]
        }
        
        return sum
    }
    
    func maxRotateFunction(_ nums: [Int]) -> Int {
        var maxVal = Int.min
        for idx in 0..<nums.count {
            maxVal = max(maxVal, multipleFrom(startIndex: idx, nums: nums))
        }
        
        return maxVal
    }
}
