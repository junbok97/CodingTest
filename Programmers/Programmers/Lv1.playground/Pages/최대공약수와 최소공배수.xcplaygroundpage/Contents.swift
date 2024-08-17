import Foundation

func gcd(_ n:Int, _ m:Int) -> Int {
    if n == 0 {
        return m
    } else {
        return gcd(m % n, n)
    }
}

func lcm(_ n:Int, _ m:Int) -> Int {
    return n * m / gcd(n, m)
}

func solution(_ n:Int, _ m:Int) -> [Int] {
    return [gcd(min(n, m),max(n, m)), lcm(min(n, m),max(n, m))]
}
