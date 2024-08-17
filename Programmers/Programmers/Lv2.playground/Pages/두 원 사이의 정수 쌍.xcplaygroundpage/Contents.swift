import Foundation

func solution(_ r1:Int, _ r2:Int) -> Int64 {

    var count1 = 0
    var count2 = 0
    var x = 1

    while x < r2 {
        count2 += Int(sqrt(Double(r2*r2 - x*x)))
        x += 1
    }

    x = 1
    while x < r1 {
        let y = sqrt(Double(r1*r1 - x*x))
        if Int(exactly: y) == nil { count1 += Int(y) }
        else { count1 += Int(y) - 1 }
        x += 1
    }

    return Int64(r2 - r1 + 1 + count2 - count1) * 4
}
