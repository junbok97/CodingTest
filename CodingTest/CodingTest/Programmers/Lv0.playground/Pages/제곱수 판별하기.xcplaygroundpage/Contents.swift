import Foundation

func solution(_ n:Int) -> Int {
    let sqr = Int(sqrt(Double(n)))
    return sqr * sqr == n ? 1 : 2
}
