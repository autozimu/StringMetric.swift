extension String {
    var count: Int {
        return self.characters.count
    }
    
    func index(_ i: Int) -> String.CharacterView.Index {
        if i >= 0 {
            return self.index(self.startIndex, offsetBy: i)
        } else {
            return self.index(self.endIndex, offsetBy: i)
        }
    }
    
    subscript(i: Int) -> Character? {
        if i < self.count {
            return self[index(i)]
        } else {
            return nil
        }
        
    }
    
    subscript(r: Range<Int>) -> String {
        return self[index(r.lowerBound)..<index(r.upperBound)]
    }
}