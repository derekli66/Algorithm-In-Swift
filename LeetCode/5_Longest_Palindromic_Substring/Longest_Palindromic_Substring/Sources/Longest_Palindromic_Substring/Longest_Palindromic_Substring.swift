class Solution {
    private func findLognestLengthFromCenter(_ chars: [Character], lptr: Int, rptr:Int) -> Int {
        if chars.count == 0 { return 0 }
        if lptr > rptr { return 0 }
        
        var left = lptr
        var right = rptr
        
        var start = 0
        var end = 0
        while left >= 0 && right < chars.count && chars[left] == chars[right] {
            start = left
            end = right
            left -= 1
            right += 1
        }
        
        return end - start + 1
    }
    
    func longestPalindrome(_ s: String) -> String {
        if s.count < 2 {
            return s
        }
                
        let chars = Array(s)
        var start = 0
        var end = 0
        
        for idx in 0..<s.count - 1 {
            let len1 = findLognestLengthFromCenter(chars, lptr: idx, rptr: idx)
            let len2 = findLognestLengthFromCenter(chars, lptr: idx, rptr: idx + 1)
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
        
        return String(chars[start..<end+1])
    }
}
