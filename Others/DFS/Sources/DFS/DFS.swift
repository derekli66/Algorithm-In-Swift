import Foundation

func dfsMatrix(_ graphMatrix: [[Int]], _ source: Int, _ visited: inout [Int], _ traverse: (Int) -> Void) {
    if graphMatrix.count != visited.count {
        print("[Debug] The number of graph elements did not match with visited array.")
        return
    }

    // Start DFS traversal
    if visited[source] != 1 {
        visited[source] = 1
        print("[Debug] Visit source: \(source)")
        traverse(source)
        let list = graphMatrix[source]
        for idx in 0..<list.count {
            if list[idx] != 0 && visited[idx] != 1 {
                dfsMatrix(graphMatrix, idx, &visited, traverse)
            }
        }
    }
}

public func dfs(_ graphMatrix: [[Int]], _ source: Int, _ traverse: (Int) -> Void = {_ in}) {
    var visited = Array(repeating: 0, count: graphMatrix.count)
    dfsMatrix(graphMatrix, source, &visited, traverse)
}
