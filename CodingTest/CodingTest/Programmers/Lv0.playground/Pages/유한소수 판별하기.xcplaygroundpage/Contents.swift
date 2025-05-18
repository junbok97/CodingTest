import Foundation

func gcd(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
        return a
    } else {
        return gcd (b, a % b)
    }
    
}

func primefactor(_ n:Int) -> Set<Int> {
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
    return result
}


func solution(_ a:Int, _ b:Int) -> Int {
    
    let gcdAB = gcd(a,b)
    let a = a / gcdAB
    let b = b / gcdAB
    
    if b == 1 {
        return 1
    }
    
    return b == 1 ? 1 : primefactor(b).isSubset(of: [2,5]) ? 1 : 2
}

solution(11, 22)

