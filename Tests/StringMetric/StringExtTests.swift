import XCTest
@testable import StringMetric

class StringExtTests: XCTestCase {
    func testStringCount() {
        XCTAssertEqual("".count, 0)
        XCTAssertEqual("YO".count, 2)
    }

    func testStringSubscriptOfInt() {
        let s = "YO"

        XCTAssertEqual(s[0], "Y")
        XCTAssertEqual(s[1], "O")

        XCTAssertEqual(s[-1], "O")
        XCTAssertEqual(s[-2], "Y")

        XCTAssertEqual(s[s.count], nil)
        XCTAssertEqual(s[-s.count-1], nil)
    }

    func testStringSubscriptOfIntRagne() {
        let s = "YO"

        XCTAssertEqual(s[0..<2], "YO")
        XCTAssertEqual(s[0..<1], "Y")
        XCTAssertEqual(s[0..<0], "")

        XCTAssertEqual(s[0..<s.count-1], "Y")
    }

    static let allTests = [
        ("testStringCount", testStringCount),
        ("testStringSubscriptOfInt", testStringSubscriptOfInt),
        ("testStringSubscriptOfRange", testStringSubscriptOfIntRagne),
    ]
}
