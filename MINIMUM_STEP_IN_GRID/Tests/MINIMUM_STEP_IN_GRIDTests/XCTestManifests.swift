import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(MINIMUM_STEP_IN_GRIDTests.allTests)
    ]
}
#endif
