import Foundation

func solution(_ n:Int) -> Int {
   
    var result = 1
    var i = 1
    while result <= n {
        i += 1
        result *= i
    }
    
    return i - 1
}

solution(7)
