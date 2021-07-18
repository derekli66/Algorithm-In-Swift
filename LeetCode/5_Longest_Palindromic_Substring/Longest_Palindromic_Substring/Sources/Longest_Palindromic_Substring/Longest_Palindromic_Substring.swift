class Solution {
    private func findLognestLengthFromCenter(_ s: String, lptr: Int, rptr:Int) -> Int {
        if s.count == 0 { return 0 }
        if lptr > rptr { return 0 }
        
        let characters = Array(s)
        var left = lptr
        var right = rptr
        
        var start = 0
        var end = 0
        while left >= 0 && right < characters.count && characters[left] == characters[right] {
            start = left
            end = right
            left -= 1
            right += 1
        }
        
        return end - start + 1
    }
    
    func longestPalindrome(_ s: String) -> String {
        
        var start = 0
        var end = 0
        
        for idx in 0..<s.count {
            let len1 = findLognestLengthFromCenter(s, lptr: idx, rptr: idx)
            let len2 = findLognestLengthFromCenter(s, lptr: idx, rptr: idx + 1)
            let maxLen = max(len1, len2)
            
            if maxLen > end - start + 1 {
                if maxLen % 2 == 0 {
                    start = idx - (maxLen / 2 - 1)
                    end = idx + maxLen / 2
                }
                else {
                    start = idx - maxLen / 2
                    end = idx + maxLen / 2
                }
            }
        }
        
        let startIndex = s.index(s.startIndex, offsetBy: start)
        let endIndex = s.index(s.startIndex, offsetBy: end + 1)
        return String(s[startIndex..<endIndex])
    }
}
