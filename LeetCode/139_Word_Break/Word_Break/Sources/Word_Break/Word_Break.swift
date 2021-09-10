class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        let chars = Array(s)
        return wordBreak(chars, wordDict)
    }
    
    private func wordBreak(_ characters: [Character], _ wordDict: [String]) -> Bool {
        if characters.count == 0 { return false }
        if wordDict.contains(String(characters)) { return true }
        
        var result = false
        for idx in 0..<characters.count {
            let subArray = characters[0..<idx]
            let str = String(subArray)
            if wordDict.contains(str) {
                let remaining = Array(characters[idx..<characters.count])
                let didContained = wordBreak(remaining, wordDict)
                result = (result || didContained)
            }
        }
        
        return result
    }
}
