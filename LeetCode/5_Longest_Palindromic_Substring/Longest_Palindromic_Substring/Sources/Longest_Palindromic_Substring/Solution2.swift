class Solution2 {
    typealias PalindromePosition = (index: Int, length: Int)
    
    private var dp = [[Bool]]()
    
    func longestPalindrome(_ s: String) -> String {
        if s.count <= 1 {
            return s
        }
        
        let chars = Array(s)
        
        dp = Array(repeating: Array(repeating: false, count: s.count + 1), count: s.count + 1)
        
        for idx in 0..<s.count {
            dp[idx][idx] = true
        }
        
        var maxLenPosition = (index: 0, length: 1)

        for i in 1..<s.count {
            var j = 0
            while j < s.count - i {
                if chars[j] == chars[j + i] && dp[j + 1][j + i - 1] == true {
                    dp[j][j + i] = true
                    let newPosition = (index: j, length: i + 1)
                    maxLenPosition = newPosition.length > maxLenPosition.length ? newPosition : maxLenPosition
                }
                else if chars[j] == chars[j + i] && i == 1 {
                    dp[j][j + i] = true
                    let newPosition = (index: j, length: 2)
                    maxLenPosition = newPosition.length > maxLenPosition.length ? newPosition : maxLenPosition
                }
                else {
                    dp[j][j + i] = false
                }
                j += 1
            }
        }
        
        let begin = maxLenPosition.index
        let end = maxLenPosition.index + maxLenPosition.length
        let substring = String(chars[begin..<end])
        
        return substring
    }
}

