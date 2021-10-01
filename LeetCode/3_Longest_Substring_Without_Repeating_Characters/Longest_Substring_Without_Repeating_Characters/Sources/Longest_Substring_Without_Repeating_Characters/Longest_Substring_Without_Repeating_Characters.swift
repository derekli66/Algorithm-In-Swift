class Solution {
    private func removePrevious(_ begin: Int,_ end: Int, _ charMap:[Character: Int],_ characters: [Character]) -> [Character: Int] {
        var resultMap = charMap
        for idx in begin...end {
            resultMap[characters[idx]] = nil
        }
        
        return resultMap
    }
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let chars = Array(s)
        
        var charMap = [Character: Int]()
        var maxLen = 0
        var anchor = 0
        for idx in 0..<chars.count {
            let char = chars[idx]
            if charMap[char] != nil {
                maxLen = max(maxLen, idx - anchor)
                let diffIndex = charMap[char]!
                charMap = removePrevious(anchor, diffIndex, charMap, chars)
                anchor = diffIndex + 1
                charMap[char] = idx
            }
            else {
                charMap[char] = idx
            }
        }
        
        maxLen = max(maxLen, s.count - anchor)
       
        return maxLen
    }
}
