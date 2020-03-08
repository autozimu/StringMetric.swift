import XCTest
@testable import StringMetric

class StringMetricTests: XCTestCase {
    func testDistanceLevenshtein() {
        XCTAssertEqual("".distanceLevenshtein(between: "sitting"), 7)
        XCTAssertEqual("kitten".distanceLevenshtein(between: ""), 6)
        XCTAssertEqual("kitten".distanceLevenshtein(between: "sitting"), 3)
        XCTAssertEqual("saturday".distanceLevenshtein(between: "sunday"), 3)

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
        XCTAssertEqual("research".distanceMostFreqK(between: "seeking", K: 2), 8)
        XCTAssertEqual("night".distanceMostFreqK(between: "nacht", K: 2), 9)
        XCTAssertEqual("my".distanceMostFreqK(between: "a", K: 2), 10)
        XCTAssertEqual("research".distanceMostFreqK(between: "resarch", K: 2), 6)
        XCTAssertEqual("aaaaabbbb".distanceMostFreqK(between: "ababababa", K: 2), 1)
        XCTAssertEqual("significant".distanceMostFreqK(between: "capabilities", K: 2), 7)
        XCTAssertEqual("aabbbcc".distanceMostFreqK(between: "bbccddee", K: 3), 5)
    }

    func testDistanceNormalizedMostFrequentK() {
        XCTAssertEqual("research".distanceNormalizedMostFrequentK(between: "seeking", k: 2), 0.2666, accuracy: 0.001)
        XCTAssertEqual("night".distanceNormalizedMostFrequentK(between: "nacht", k: 2), 0.2)
        XCTAssertEqual("my".distanceNormalizedMostFrequentK(between: "a", k: 2), 0.0)
        XCTAssertEqual("research".distanceNormalizedMostFrequentK(between: "resarch", k: 2), 0.4666, accuracy: 0.001)
        XCTAssertEqual("aaaaabbbb".distanceNormalizedMostFrequentK(between: "ababababa", k: 2), 1.0)
        XCTAssertEqual("significant".distanceNormalizedMostFrequentK(between: "capabilities", k: 2), 0.2609, accuracy: 0.001)
        XCTAssertEqual("aabbbcc".distanceNormalizedMostFrequentK(between: "bbccddee", k: 3), 0.6)
    }

    func testDistanceJaroWinkler() {
        XCTAssertEqual("".distanceJaroWinkler(between: ""), 1.0)
        XCTAssertEqual("".distanceJaroWinkler(between: "Yo"), 0.0)
        XCTAssertEqual("search".distanceJaroWinkler(between: "find"), 0.0)
        XCTAssertEqual("search".distanceJaroWinkler(between: "search"), 1.0)
        XCTAssertEqual("MARTHA".distanceJaroWinkler(between: "MARHTA"), 0.961, accuracy: 0.001)
        XCTAssertEqual("DWAYNE".distanceJaroWinkler(between: "DUANE"), 0.84, accuracy: 0.001)
        XCTAssertEqual("DIXON".distanceJaroWinkler(between: "DICKSONX"), 0.814, accuracy: 0.001)
        XCTAssertEqual("kitten".distanceJaroWinkler(between: "sitting"), 0.746, accuracy: 0.001)
        XCTAssertEqual("君子和而不同".distanceJaroWinkler(between: "小人同而不和"), 0.555, accuracy: 0.001)
    }

    static let allTests = [
        ("testDistanceLevenshtein", testDistanceLevenshtein),
        ("testDistanceDamerauLevenshtein", testDistanceDamerauLevenshtein),
        ("testDistanceHamming", testDistanceHamming),
        ("testDistanceMostFreqK", testDistanceMostFreqK),
        ("testDistanceNormalizedMostFrequentK", testDistanceNormalizedMostFrequentK),
        ("testDistanceJaroWinkler", testDistanceJaroWinkler),
    ]
}
