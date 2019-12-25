import XCTest
@testable import BucketSort

final class BucketSortTests: XCTestCase {
    func testBucketSort() {
        print("[Debug] Start testBucketSort")
        var unsorted = [-1, 5, 5, 6, 6, 4, 3, 2, 2, 1, 7, 8, 11, -100, -50, 100]
        Solution.bucketSort(&unsorted)
        for idx in 1..<unsorted.count {
            XCTAssert(unsorted[idx - 1] <= unsorted[idx])
        }

        unsorted = [5, 5, 6, 6, 4, 3, 2, 2, 1, 7, 8, 11]
        Solution.bucketSort(&unsorted)
        for idx in 1..<unsorted.count {
            XCTAssert(unsorted[idx - 1] <= unsorted[idx])
        }

        unsorted = [5, 5, 6, 6, 6, 6, 6, 6, 6, 6, 1]
        Solution.bucketSort(&unsorted)
        for idx in 1..<unsorted.count {
            XCTAssert(unsorted[idx - 1] <= unsorted[idx])
        }

        unsorted = [6, 6, 6, 6, 6, 6, 6, 6, 6, 6, 6]
        Solution.bucketSort(&unsorted)
        for idx in 1..<unsorted.count {
            XCTAssert(unsorted[idx - 1] <= unsorted[idx])
        }

        unsorted = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        Solution.bucketSort(&unsorted)
        for idx in 1..<unsorted.count {
            XCTAssert(unsorted[idx - 1] <= unsorted[idx])
        }
    }

    static var allTests = [
        ("testBucketSort", testBucketSort)
    ]
}
