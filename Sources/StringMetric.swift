import Foundation

extension String {
    var length: Int {
        return self.characters.count
    }
    
    func index(_ i: Int) -> String.CharacterView.Index {
        if i >= 0 {
            return self.index(self.startIndex, offsetBy: i)
        } else {
            return self.index(self.endIndex, offsetBy: i)
        }
    }
    
    subscript(i: Int) -> Character {
        return self[index(i)]
    }
    
    subscript(r: Range<Int>) -> String {
        return self[index(r.lowerBound)..<index(r.upperBound)]
    }
    
    public func LevenshteinDistance(_ other: String) -> Int {
        if self.length == 0 || other.length == 0 {
            return max(self.length, other.length)
        }
        
        var cost = 1
        if self[-1] == other[-1] {
            cost = 0
        }
        
        return min(
            self[0..<self.length-1].LevenshteinDistance(other) + 1,
            self.LevenshteinDistance(other[0..<other.length-1]) + 1,
            self[0..<self.length-1].LevenshteinDistance(other[0..<other.length-1]) + cost
        )
    }
}