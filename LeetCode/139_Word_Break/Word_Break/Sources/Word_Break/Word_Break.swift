class Solution {
    func wordBreak(_ s: String, _ wordDict: [String]) -> Bool {
        var wordHashMap = [String:Int]()
        
        for str in wordDict {
            wordHashMap[str] = 1
        }
        
        return wordBreaker(s, wordHashMap)
    }
    
    private var dp = [String: Bool]()
    
    private func wordBreaker(_ s: String, _ wordDict: [String:Int]) -> Bool {
        if dp[s] != nil { return dp[s]! }
        if s.count == 0 || wordDict[s] != nil  { return true }
        
        for idx in 0..<s.count {
            let firstIndex = s.startIndex
            let currentIndex = s.index(s.startIndex, offsetBy: idx)
            let subArray = s[firstIndex..<currentIndex]
            let str = String(subArray)
            
            if wordDict[str] != nil {
                let remaining = s[currentIndex..<s.endIndex]
                let didContained = wordBreaker(String(remaining), wordDict)
                dp[String(remaining)] = didContained
                if true == didContained { return true }
            }
        }
        
        dp[s] = false
        return false
    }
}
