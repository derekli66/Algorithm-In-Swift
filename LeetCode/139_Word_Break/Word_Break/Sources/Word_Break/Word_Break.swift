class Solution {
//    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
//        let chars = Array(s)
//        return wordBreak(chars, wordDict)
//    }
    
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var wordHashMap = [String:Int]()
        
        for str in wordDict {
            wordHashMap[str] = 1
        }
        
        return wordBreaker(s, wordHashMap)
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
    
    private func wordBreaker(_ s: String, _ wordDict: [String:Int]) -> Bool {
        if s.count == 0 { return false }
        if wordDict[s] != nil { return true }
        
        for idx in 0..<s.count {
            let firstIndex = s.startIndex
            let currentIndex = s.index(s.startIndex, offsetBy: idx)
            let subArray = s[firstIndex..<currentIndex]
            let str = String(subArray)
            
            if wordDict[str] != nil {
                let remaining = s[currentIndex..<s.endIndex]
                let didContained = wordBreaker(String(remaining), wordDict)
                if true == didContained { return true }
            }
        }
        
        return false
    }
}
