extension String {
    func index(_ i: Int) -> String.CharacterView.Index {
        if i >= 0 {
            return self.index(self.startIndex, offsetBy: i)
        } else {
            return self.index(self.endIndex, offsetBy: i)
        }
    }

    subscript(i: Int) -> Character? {
        if i >= count || i < -count {
            return nil
        }

        return self[index(i)]
    }
}
