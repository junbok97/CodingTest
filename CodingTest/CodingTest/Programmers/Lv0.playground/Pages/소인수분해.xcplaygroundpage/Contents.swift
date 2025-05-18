import Foundation

func solution(_ n:Int) -> [Int] {
    
    var n = n
    var prime = 2
    var result = Set<Int>()
    
    while n >= prime {
        if n % prime == 0 {
            n /= prime
            result.insert(prime)
        } else {
            prime += 1
        }
    }
    return Array(result).sorted()
}

solution(100)
