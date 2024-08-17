func solution(_ msg:String) -> [Int] {
    var i = 0
    var str = ""
    var msg = Array(msg)
    var result = [Int]()
    var dict: [String: Int] = ["A": 1, "B": 2, "C": 3, "D": 4, "E": 5, "F": 6, "G": 7, "H": 8, "I": 9, "J": 10, "K": 11, "L": 12, "M": 13, "N": 14, "O": 15, "P": 16, "Q": 17, "R": 18, "S": 19, "T": 20, "U": 21, "V": 22, "W": 23, "X": 24, "Y": 25, "Z": 26]

    while i < msg.count {
        let c = String(msg[i])
        var tmp = str + c
        
        guard let _ = dict[tmp] else {
            dict[tmp] = dict.count + 1
            result.append(dict[str]!)
            str = ""
            continue
        }
        str += c
        i += 1
    }
    
    result.append(dict[str]!)

    return result
}

solution("TOBEORNOTTOBEORTOBEORNOT")
