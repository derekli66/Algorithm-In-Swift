//class ListNode {
//    var val: Int = 0
//    var next: ListNode? = nil
//    init(_ val: Int) {
//        self.val = val
//    }
//}
//
//let node1: ListNode? = ListNode(1)
//let node2: ListNode? = nil
//
//print("[DEBUG] is equal? \(node1 === node2)")


    func reverse(_ x: Int) -> Int {
        var sum = 0
        var remaining = x

        while remaining != 0 {
            let modulo = remaining % 10
            remaining = remaining / 10
            
            if sum < Int32.max / 10 && modulo >= Int32.max % 10 {
                return 0
            }
            
            if sum > Int32.min / 10 && modulo <= Int32.min % 10 {
                return 0
            }
            
            sum = sum * 10 + modulo
        }
        
        return sum
    }


let x = 900000
let rev = reverse(x)
print("\(rev)")
