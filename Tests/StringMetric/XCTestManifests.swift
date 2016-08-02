import XCTest

#if !os(OSX)
public let allTests = [
    testCase(StringExtTests.allTests),
    testCase(StringMetricTests.allTests),
]
#endif