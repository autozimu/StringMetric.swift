import Foundation

extension String {
    /**
     Get distance between target. (alias of `distanceJaroWinkler`.)

     - parameter target: target string
     - returns: Jaro-Winkler distance
     */
    public func distance(between target: String) -> Double {
        return distanceJaroWinkler(between: target)
    }

    /**
     Get Levenshtein distance between target.

     Reference <https://en.wikipedia.org/wiki/Levenshtein_distance#Iterative_with_two_matrix_rows>.

     - parameter target: target string
     - returns: Levenshtein distance
     */
    public func distanceLevenshtein(between target: String) -> Int {
        let selfCount = self.count
        let targetCount = target.count

        if self == target {
            return 0
        }
        if selfCount == 0 {
            return targetCount
        }
        if targetCount == 0 {
            return selfCount
        }

        // The previous row of distances
        var v0 = [Int](repeating: 0, count: targetCount + 1)
        // Current row of distances.
        var v1 = [Int](repeating: 0, count: targetCount + 1)
        // Initialize v0.
        // Edit distance for empty self.
        for i in 0..<v0.count {
            v0[i] = i
        }

        for i in 0..<selfCount {
            // Calculate v1 (current row distances) from previous row v0

            // Edit distance is delete (i + 1) chars from self to match empty t.
            v1[0] = i + 1

            // Use formula to fill rest of the row.
            for j in 0..<targetCount {
                let cost = self[i] == target[j] ? 0 : 1
                v1[j + 1] = Swift.min(
                    v1[j] + 1,
                    v0[j + 1] + 1,
                    v0[j] + cost
                )
            }

            // Copy current row to previous row for next iteration.
            for j in 0..<v0.count {
                v0[j] = v1[j]
            }
        }

        return v1[targetCount]
    }


    /**
     Get Damerau-Levenshtein distance between target.

     Reference <https://en.wikipedia.org/wiki/Damerau%E2%80%93Levenshtein_distance#endnote_itman#Distance_with_adjacent_transpositions>

     - parameter target: target string
     - returns: Damerau-Levenshtein distance
     */
    public func distanceDamerauLevenshtein(between target: String) -> Int {
        let selfCount = self.count
        let targetCount = target.count

        if self == target {
            return 0
        }
        if selfCount == 0 {
            return targetCount
        }
        if targetCount == 0 {
            return selfCount
        }

        var da: [Character: Int] = [:]

        var d = Array(repeating: Array(repeating: 0, count: targetCount + 2), count: selfCount + 2)

        let maxdist = selfCount + targetCount
        d[0][0] = maxdist
        for i in 1...selfCount + 1 {
            d[i][0] = maxdist
            d[i][1] = i - 1
        }
        for j in 1...targetCount + 1 {
            d[0][j] = maxdist
            d[1][j] = j - 1
        }

        for i in 2...selfCount + 1 {
            var db = 1

            for j in 2...targetCount + 1 {
                let k = da[target[j - 2]!] ?? 1
                let l = db

                var cost = 1
                if self[i - 2] == target[j - 2] {
                    cost = 0
                    db = j
                }

                let substition = d[i - 1][j - 1] + cost
                let injection = d[i][j - 1] + 1
                let deletion = d[i - 1][j] + 1
                let selfIdx = i - k - 1
                let targetIdx = j - l - 1
                let transposition = d[k - 1][l - 1] + selfIdx + 1 + targetIdx

                d[i][j] = Swift.min(
                    substition,
                    injection,
                    deletion,
                    transposition
                )
            }

            da[self[i - 2]!] = i
        }

        return d[selfCount + 1][targetCount + 1]
    }


    /**
     Get Hamming distance between self and target.

     Note: only applicable when string lengths are equal.

     Reference <https://en.wikipedia.org/wiki/Hamming_distance>.

     - parameter target: target string
     - returns: Hamming distance
     */
    public func distanceHamming(between target: String) -> Int {
        let selfCount = self.count
        let targetCount = target.count

        assert(selfCount == targetCount)

        var dist = 0
        for i in 0..<selfCount {
            if self[i] != target[i] {
                dist += 1
            }
        }

        return dist
    }

    func MostFreqKHashing(str: String, K: Int) -> [Character: Int] {
        var freq: [Character: Int] = [:]
        for char in str {
            freq[char] = (freq[char] ?? 0) + 1
        }

        var KFreq: [Character: Int] = [:]
        for (char, count) in  freq.sorted(by: {$0.value > $1.value})[0..<K]{
            KFreq[char] = count
        }

        return KFreq
    }

    func MostFreqKSimilarity(freq1: [Character: Int], freq2: [Character: Int]) -> Int {
        var similarity = 0
        for (char, count1) in freq1 {
            if let count2 = freq2[char] {
                similarity += count1 + count2
            }
        }
        return similarity
    }

    /**
     Get most frequent K distance.

     Reference <https://en.wikipedia.org/wiki/Most_frequent_k_characters>.

     - parameters:
        - target: target string
        - K: number of characters
        - maxDistance: max distance (default to 10)
     - returns: most frequent K distance
     */
    public func distanceMostFreqK(between target: String, K: Int, maxDistance: Int = 10) -> Int {
        return maxDistance - MostFreqKSimilarity(
            freq1: MostFreqKHashing(str: self, K: K),
            freq2: MostFreqKHashing(str: target, K: K))
    }


    /**
    Get Jaro-Winkler distance.

    (Score is normalized such that 0 equates to no similarity and 1 is an
    exact match.)

    <https://en.wikipedia.org/wiki/Jaro%E2%80%93Winkler_distance>

    - parameter target: target string
    - returns: Jaro-Winkler distance
    */
    public func distanceJaroWinkler(between target: String) -> Double {
        var stringOne = self
        var stringTwo = target
        if stringOne.count > stringTwo.count {
            stringTwo = self
            stringOne = target
        }

        let stringOneCount = stringOne.count
        let stringTwoCount = stringTwo.count

        if stringOneCount == 0 && stringTwoCount == 0 {
            return 1.0
        }

        let matchingDistance = stringTwoCount / 2
        var matchingCharactersCount: Double = 0
        var transpositionsCount: Double = 0
        var previousPosition = -1

        // Count matching characters and transpositions.
        for (i, stringOneChar) in stringOne.enumerated() {
            for j in max(0, i - matchingDistance)..<min(stringTwoCount, i + matchingDistance) {
                if stringOneChar == stringTwo[j] {
                    matchingCharactersCount += 1
                    if previousPosition != -1 && j < previousPosition {
                        transpositionsCount += 1
                    }
                    previousPosition = j
                    break
                }
            }
        }

        if matchingCharactersCount == 0.0 {
            return 0.0
        }

        // Count common prefix (up to a maximum of 4 characters)
        let commonPrefixCount = min(max(Double(self.commonPrefix(with: target).count), 0), 4)

        let jaroSimilarity = (matchingCharactersCount / Double(stringOneCount) + matchingCharactersCount / Double(stringTwoCount) + (matchingCharactersCount - transpositionsCount) / matchingCharactersCount) / 3

        // Default is 0.1, should never exceed 0.25 (otherwise similarity score could exceed 1.0)
        let commonPrefixScalingFactor = 0.1

        return jaroSimilarity + commonPrefixCount * commonPrefixScalingFactor * (1 - jaroSimilarity)
    }
}
