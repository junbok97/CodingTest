import Foundation

func solution(_ s:String) -> [Int] {
    
    var s = s
    var count = 0
    var zeroCount = 0
    
    while s != "1" {
        count += 1
        zeroCount += s.components(separatedBy: "1").joined().count
        s = String(s.components(separatedBy: "0").joined().count, radix: 2)
    }

    return [count, zeroCount]
}


solution("110010101001")
