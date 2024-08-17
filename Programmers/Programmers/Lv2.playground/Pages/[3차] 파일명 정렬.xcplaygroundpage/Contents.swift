extension String{
    var numeric: ClosedRange<Character> { return "0"..."9" }
    var head: String{
        return self.prefix { numeric.contains($0) == false }.uppercased()
    }
    var number: Int {
        return Int( self.drop   { numeric.contains($0) == false}
                        .prefix { numeric.contains($0) == true })!
    }
}

func solution(_ files:[String]) -> [String] {

    return files.enumerated().sorted { (lhs, rhs) in
        let l = lhs.element
        let r = rhs.element
        if l.head != r.head { return l.head < r.head}
        if l.number != r.number { return l.number < r.number}
        return lhs.offset < rhs.offset

    }.map{ $0.element }
}
