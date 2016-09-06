import XCTest
@testable import StringMetric

class StringMetricTests: XCTestCase {
    func testDistanceLevenshtein() {
        XCTAssertEqual("".distanceLevenshtein(between: "sitting"), 7)
        XCTAssertEqual("kitten".distanceLevenshtein(between: ""), 6)
        XCTAssertEqual("kitten".distanceLevenshtein(between: "sitting"), 3)

        XCTAssertEqual("君子和而不同".distanceLevenshtein(between: "小人同而不和"), 4)
    }

    func testDistanceDamerauLevenshtein() {
        XCTAssertEqual("".distanceDamerauLevenshtein(between: "sitting"), 7)
        XCTAssertEqual("kitten".distanceDamerauLevenshtein(between: ""), 6)
        XCTAssertEqual("kitten".distanceDamerauLevenshtein(between: "sitting"), 3)

        XCTAssertEqual("CA".distanceDamerauLevenshtein(between: "AC"), 1)
        XCTAssertEqual("specter".distanceDamerauLevenshtein(between: "spectre"), 1)
        XCTAssertEqual("CA".distanceDamerauLevenshtein(between: "ABC"), 2)

        XCTAssertEqual("君子和而不同".distanceDamerauLevenshtein(between: "小人同而不和"), 4)
    }

    func testDistanceHamming() {
        XCTAssertEqual("karolin".distanceHamming(between: "kathrin"), 3)
        XCTAssertEqual("karolin".distanceHamming(between: "kerstin"), 3)
        XCTAssertEqual("1011101".distanceHamming(between: "1001001"), 2)
        XCTAssertEqual("2173896".distanceHamming(between: "2233796"), 3)
    }

    func testDistanceMostFreqK() {
        XCTAssertEqual("research".distanceMostFreqK(between: "seeking", K: 2), 6)
    }

    func testDistanceJoraWinkler() {
        XCTAssertEqual("".distanceJaroWinkler(between: ""), 1.0)
        XCTAssertEqual("".distanceJaroWinkler(between: "Yo"), 0.0)
        XCTAssertEqual("search".distanceJaroWinkler(between: "find"), 0.0)
        XCTAssertEqual("search".distanceJaroWinkler(between: "search"), 1.0)
        XCTAssertEqualWithAccuracy("MARTHA".distanceJaroWinkler(between: "MARHTA"), 0.961, accuracy: 0.001)
        XCTAssertEqualWithAccuracy("DWAYNE".distanceJaroWinkler(between: "DUANE"), 0.84, accuracy: 0.001)
        XCTAssertEqualWithAccuracy("DIXON".distanceJaroWinkler(between: "DICKSONX"), 0.814, accuracy: 0.001)
    }

    static let allTests = [
        ("testDistanceLevenshtein", testDistanceLevenshtein),
        ("testDistanceDamerauLevenshtein", testDistanceDamerauLevenshtein),
        ("testDistanceHamming", testDistanceHamming),
        ("testDistanceMostFreqK", testDistanceMostFreqK),
        ("testDistanceJoraWinkler", testDistanceJoraWinkler),
    ]
}
