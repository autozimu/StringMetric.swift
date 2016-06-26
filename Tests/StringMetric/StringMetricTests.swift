import XCTest
@testable import StringMetric

class StringMetricTests: XCTestCase {
    func testLevenshteinDistance() {
        XCTAssertEqual("".LevenshteinDistance(between: "sitting"), 7)
        XCTAssertEqual("kitten".LevenshteinDistance(between: ""), 6)
        XCTAssertEqual("kitten".LevenshteinDistance(between: "sitting"), 3)
    }

    static var allTests = [
        ("testLevenshteinDistance", testLevenshteinDistance),
    ]
}
