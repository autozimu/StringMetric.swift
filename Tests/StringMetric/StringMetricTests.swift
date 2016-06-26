import XCTest
@testable import StringMetric

class StringMetricTests: XCTestCase {
    func testLength() {
        XCTAssertEqual("".length, 0)
        XCTAssertEqual("YO".length, 2)
    }
    
    func testSubscriptOfInt() {
        let s = "YO"

        XCTAssertEqual(s[0], "Y")
        XCTAssertEqual(s[1], "O")
        
        XCTAssertEqual(s[-1], "O")
        XCTAssertEqual(s[-2], "Y")
    }
    
    func testSubscriptOfIntRagne() {
        let s = "YO"
        
        XCTAssertEqual(s[0..<2], "YO")
        XCTAssertEqual(s[0..<1], "Y")
        XCTAssertEqual(s[0..<0], "")
        
        XCTAssertEqual(s[0..<s.length-1], "Y")
    }
    
    func testDistanceLevenshtein() {
        XCTAssertEqual("kitten".LevenshteinDistance("sitting"), 3)
    }


    #if !os(OSX)
    static var allTests = [
        ("testExample", testExample),
    ]
    #endif
}
