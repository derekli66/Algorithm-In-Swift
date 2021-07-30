class Solution {
    private var cached = [Int: Int]()
    
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        var sortedCoins = coins.sorted()
        sortedCoins = sortedCoins.reversed()
        return change(amount, sortedCoins, 0)
    }
    
    func change(_ amount: Int, _ sortedCoins: [Int], _ startIndex: Int) -> Int {
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
        
        return theWay
    }
}
