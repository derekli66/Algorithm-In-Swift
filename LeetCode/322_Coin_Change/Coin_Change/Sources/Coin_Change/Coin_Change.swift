class Solution {
    func coinChange(_ coins: [Int], _ amount: Int) -> Int {
        var dp = Array(repeating: Array(repeating: amount + 1, count: amount + 1), count: coins.count)
        
        for idx in 0..<coins.count {
            dp[idx][0] = 0
        }
        
        for idx in 0..<coins.count {
            let coin = coins[idx]
            
            for i in 1...amount {
                if i >= coin {
                    let previous = i - coin
                    dp[idx][i] = previousMinimum(previous, dp) + 1
                }
            }
        }
     
        return dp[coins.count - 1][amount] > amount ? -1 : dp[coins.count - 1][amount]
    }
    
    private func previousMinimum(_ amount: Int, _ cache: [[Int]]) -> Int {
        var currentMinimum = Int.max
        
        for idx in 0..<cache.count {
            currentMinimum = min(cache[idx][amount], currentMinimum)
        }
        
        return currentMinimum
    }
}
