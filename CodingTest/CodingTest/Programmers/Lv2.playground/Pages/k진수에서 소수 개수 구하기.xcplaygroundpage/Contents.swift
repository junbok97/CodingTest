import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    String(n, radix: k).split(separator: "0").map { Int($0)! }.filter { isPrime($0) }.count
}

func isPrime(_ n: Int) -> Bool {
    if n <= 1 {
        return false
    }
    var i = 2
    while i < Int(sqrt(Double(n))) + 1 {
        if n % i == 0 {
            return false
        }
        i += 1
    }
    return true
}


func solution2(_ n:Int, _ k:Int) -> Int {
    String(n, radix: k).split(separator: "0").map { Int($0)! }.filter {
        if $0 <= 1 {
            return false
        } else if $0 <= 3 {
            return true
        } else {
            for i in 2...Int(sqrt(Double($0))) + 1 {
                if $0 % i == 0 {
                    return false
                }
            }
            return true
        }
    }.count
}

solution2(437674, 3)
