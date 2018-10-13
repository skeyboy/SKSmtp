import XCTest

#if !os(macOS)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(SKSmtpTests.allTests),
    ]
}
#endif