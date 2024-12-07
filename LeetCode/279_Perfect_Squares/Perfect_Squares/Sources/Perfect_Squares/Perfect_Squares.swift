class Solution {
    
    func numSquares(_ n: Int) -> Int {
        
        dp = Array(repeating: -1, count: n + 1)
        
        return numSqu(n)
    }
    
    private var dp = [Int]()
    
    private func numSqu(_ n: Int) -> Int {
        if n < 1 { return 0 }
        if n == 1 { return 1 }
        
        if dp[n] != -1 { return dp[n] }
        
        var minimumWay = Int.max
        
        for val in 1...n {
            if n >= val * val {
                minimumWay = min(minimumWay, 1 + numSqu(n - val * val))
            }
        }
        
        dp[n] = minimumWay
        
        return dp[n]
    }
}
