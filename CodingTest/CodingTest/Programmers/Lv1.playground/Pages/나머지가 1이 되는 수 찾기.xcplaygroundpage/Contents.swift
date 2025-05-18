import Foundation

func solution(_ n:Int) -> Int {
    
    var result = n-1
    
    for i in 2..<n {
        if n % i == 1 {
            result = i
            break
        }
    }
    
    return result
}
