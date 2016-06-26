import XCTest
@testable import StringMetricTestSuite

XCTMain([
    testCase(StringExtTests.allTests)
    testCase(StringMetricTests.allTests),
])
