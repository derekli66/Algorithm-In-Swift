class Solution {
    func reverse(_ x: Int) -> Int {
        var sum = 0
        var remaining = x

        while remaining != 0 {
            let modulo = remaining % 10
            remaining = remaining / 10
            
            if sum > Int32.max / 10 && modulo >= (Int32.max - Int32.max / 10) {
                return 0
            }
            
            if sum < Int32.min / 10 && modulo <= (Int32.min - Int32.min / 10) {
                return 0
            }
            
            sum = sum * 10 + modulo
        }
        
        return sum
    }
}
