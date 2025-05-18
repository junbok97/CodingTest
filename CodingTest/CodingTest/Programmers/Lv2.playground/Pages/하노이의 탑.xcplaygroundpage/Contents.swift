import Foundation

func solution(_ n:Int) -> [[Int]] {
    
    var result: [[Int]] = []
    
    func hanoi(_ n:Int, _ from: Int, _ by: Int, _ to: Int) {
        if n == 1 {
            result.append([from, to])
            return
        }

        hanoi(n-1, from, to, by)
        hanoi(1, from, by, to)
        hanoi(n-1, by, from, to)
    }
    
    hanoi(n, 1, 2, 3)
    
    return result
}
