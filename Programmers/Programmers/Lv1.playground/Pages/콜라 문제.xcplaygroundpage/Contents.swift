import Foundation

func solution(_ a:Int, _ b:Int, _ n:Int) -> Int {
    
    var n = n
    var result = 0
    
    while a <= n {
        result += (n / a) * b
        n = (n / a) * b + n % a
    }
    
    return result
}

func solution2(_ a:Int, _ b:Int, _ n:Int) -> Int {
    return (n > b ? n - b : 0) / (a - b) * b
}

solution(5, 1, 20)
