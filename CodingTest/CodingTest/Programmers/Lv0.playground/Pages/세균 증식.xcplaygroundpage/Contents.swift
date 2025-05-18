import Foundation

func solution(_ n:Int, _ t:Int) -> Int {
    var n = n
    for _ in (1...t) {
        n *= 2
    }
    return n
}

solution(2,10)

