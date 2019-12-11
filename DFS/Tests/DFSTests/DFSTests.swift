import XCTest
@testable import DFS

final class DFSTests: XCTestCase {
    func testDfsMatrix() {
        var topSort: [Int] = []
        let graph = [[0, 0, 0, 0, 0, 0, 0],
                     [0, 0, 1, 1, 0, 0, 0],
                     [0, 1, 0, 0, 1, 0, 0],
                     [0, 1, 0, 0, 1, 0, 0],
                     [0, 0, 1, 1, 0, 1, 1],
                     [0, 0, 0, 0, 1, 0, 0],
                     [0, 0, 0, 0, 1, 0, 0]
                    ]

        // Start index is 1
        dfs(graph, 1, { (idx) in
            topSort.append(idx)
        })

        let path1 = [1, 2, 4, 3, 5, 6]
        XCTAssert(topSort.count == path1.count)
        for idx in 0..<path1.count {
            XCTAssert(topSort[idx] == path1[idx])
        }

        topSort.removeAll()
        // Start index is 4
        dfs(graph, 4, { (idx) in
            topSort.append(idx)
        })
        let path2 = [4, 2, 1, 3, 5, 6]
        XCTAssert(topSort.count == path2.count)
        for idx in 0..<path2.count {
            XCTAssert(topSort[idx] == path2[idx])
        }
    }

    static var allTests = [
        ("testDfsMatrix", testDfsMatrix)
    ]
}
