import XCTest
@testable import StringMetric

class StringMetricTests: XCTestCase {
    func testLevenshteinDistance() {
        XCTAssertEqual("".LevenshteinDistance(between: "sitting"), 7)
        XCTAssertEqual("kitten".LevenshteinDistance(between: ""), 6)
        XCTAssertEqual("kitten".LevenshteinDistance(between: "sitting"), 3)

        XCTAssertEqual("君子和而不同".LevenshteinDistance(between: "小人同而不和"), 4)
    }

    func testDamerauLevenshteinDistance() {
        XCTAssertEqual("".DamerauLevenshteinDistance(between: "sitting"), 7)
        XCTAssertEqual("kitten".DamerauLevenshteinDistance(between: ""), 6)
        XCTAssertEqual("kitten".DamerauLevenshteinDistance(between: "sitting"), 3)

        XCTAssertEqual("CA".DamerauLevenshteinDistance(between: "AC"), 1)
        XCTAssertEqual("specter".DamerauLevenshteinDistance(between: "spectre"), 1)
        XCTAssertEqual("CA".DamerauLevenshteinDistance(between: "ABC"), 2)

        XCTAssertEqual("君子和而不同".DamerauLevenshteinDistance(between: "小人同而不和"), 4)
    }

    static let allTests = [
        ("testLevenshteinDistance", testLevenshteinDistance),
        ("testDamerauLevenshteinDistance", testDamerauLevenshteinDistance),
    ]
}
