import Foundation

func solution(_ k:Int, _ d:Int) -> Int64 {
    
    var result: Int64 = 0

    for x in stride(from: 0, through: d, by: k) {
        result += Int64(floor(sqrt(Double((d*d) - (x*x))) / Double(k))) + 1
    }
    
    return result
}
