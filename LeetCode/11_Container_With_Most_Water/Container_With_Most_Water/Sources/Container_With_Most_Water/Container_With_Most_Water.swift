class Solution {
    func maxArea(_ height: [Int]) -> Int {
        var aPointer: Int = 0
        var bPointer: Int = height.count - 1
        var maxArea: Int = 0
        
        while (aPointer < bPointer) {
            if (height[aPointer] < height[bPointer]) {
                maxArea = max(maxArea, height[aPointer] * (bPointer - aPointer))
                aPointer += 1
            }
            else {
                maxArea = max(maxArea, height[bPointer] * (bPointer - aPointer))
                bPointer -= 1
            }
        }
        
        return maxArea
    }
}
