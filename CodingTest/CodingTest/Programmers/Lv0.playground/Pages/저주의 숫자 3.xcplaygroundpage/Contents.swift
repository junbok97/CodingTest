import Foundation

func solution(_ n:Int) -> Int {
    
    var result = 0
    var n = n
    
    while n > 0 {
        result += 1
        n -= 1
        if result % 3 == 0 || String(result).contains("3") {
            n += 1
        }
    }
    
    return result
}

solution(40)
