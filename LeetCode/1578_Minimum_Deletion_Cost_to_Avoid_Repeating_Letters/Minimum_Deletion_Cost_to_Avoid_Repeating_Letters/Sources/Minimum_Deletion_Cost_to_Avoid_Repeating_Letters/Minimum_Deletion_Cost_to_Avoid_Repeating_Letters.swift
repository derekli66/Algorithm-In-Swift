/*
    Back              Front

    bPtr    fPTr
    [1,      2,     3, 4, 5, 6]
**/

class Solution {
    func minCost(_ s: String, _ cost: [Int]) -> Int {
        if s.count == 0 { return 0}
        if s.count == 1 { return cost[0] }
        
        var frontPtr = 1
        var backPtr = 0
        
        let chars = Array(s)
        var minimumCost = 0
        
        while frontPtr < cost.count {
            let frontStr = String(chars[frontPtr])
            let backStr = String(chars[backPtr])
            
            if frontStr == backStr {
                if cost[backPtr] <= cost[frontPtr] {
                    minimumCost += cost[backPtr]
                    backPtr = frontPtr
                    frontPtr += 1
                }
                else {
                    minimumCost += cost[frontPtr]
                    frontPtr += 1
                }
            }
            else {
                backPtr = frontPtr
                frontPtr += 1
            }
        }
        
        return minimumCost
    }
}
