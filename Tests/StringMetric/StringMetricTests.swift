import XCTest
@testable import StringMetric

class StringMetricTests: XCTestCase {
    func testLevenshteinDistance() {
        XCTAssertEqual("".LevenshteinDistance(between: "sitting"), 7)
        XCTAssertEqual("kitten".LevenshteinDistance(between: ""), 6)
        XCTAssertEqual("kitten".LevenshteinDistance(between: "sitting"), 3)
    }

    func testLevenshteinDistanceOfUnicode() {
        XCTAssertEqual("君子和而不同".LevenshteinDistance(between: "小人同而不和"), 4)
    }

    static var allTests = [
        ("testLevenshteinDistance", testLevenshteinDistance),
    ]
}
