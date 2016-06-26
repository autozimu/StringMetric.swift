extension String {
    
    /**
     Return Levenshtein distance between target.
     
     Based on <https://en.wikipedia.org/wiki/Levenshtein_distance#Iterative_with_two_matrix_rows>.
     
     - parameter target: target string.
     - returns: edit distance between self and target.
     */
    public func LevenshteinDistance(between target: String) -> Int {
        if self == target {
            return 0
        }
        if self.count == 0 {
            return target.count
        }
        if target.count == 0 {
            return self.count
        }
        
        // The previous row of distances
        var v0 = [Int](repeating: 0, count: target.count + 1)
        // Current row of distances.
        var v1 = [Int](repeating: 0, count: target.count + 1)
        // Initialize v0.
        // Edit distance for empty self.
        for i in 0..<v0.count {
            v0[i] = i
        }
        
        for i in 0..<self.count {
            // Calculate v1 (current row distances) from previous row v0
            
            // Edit distance is delete (i + 1) chars from self to match empty t.
            v1[0] = i + 1
            
            // Use formula to fill rest of the row.
            for j in 0..<target.count {
                let cost = self[j] == target[j] ? 0 : 1
                v1[j + 1] = min(
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
        
        return v1[target.count]
    }
}