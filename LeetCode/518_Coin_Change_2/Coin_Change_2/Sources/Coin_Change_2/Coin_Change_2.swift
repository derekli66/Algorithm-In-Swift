class Solution {
    private var cached = [[Int]]()
    
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        var sortedCoins = coins.sorted()
        sortedCoins = sortedCoins.reversed()
        cached = [[Int]]()
        for _ in 0..<coins.count {
            cached.append([Int](repeating: -1, count: amount + 1))
        }
        
        return change(amount, sortedCoins, 0)
    }
    
    func change(_ amount: Int, _ sortedCoins: [Int], _ startIndex: Int) -> Int {
        if cached[startIndex][amount] != -1 {
            return cached[startIndex][amount]
        }
        
        if startIndex == sortedCoins.count - 1 {
            if amount % sortedCoins[startIndex] == 0 {
               return 1
            }
            else {
                return 0
            }
        }
        
        let targetCoin = sortedCoins[startIndex]
        var theWay = 0
        var base = 0
        
        while targetCoin * base <= amount {
            let remaining = amount - targetCoin * base
            theWay += change(remaining, sortedCoins, startIndex + 1)
            base += 1
        }
        
        cached[startIndex][amount] = theWay
        return theWay
    }
}
