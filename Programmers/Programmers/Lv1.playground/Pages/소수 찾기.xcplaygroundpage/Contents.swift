import Foundation

func isPrime(_ n: Int) -> Bool {
    if (n < 4) {
        return n == 1 ? false : true
    }
    for i in 2...Int(sqrt(Double(n))) {
        if (n % i == 0) { return false }
    }
    return true
}

func solution(_ n:Int) -> Int {
    return (2...n).filter { isPrime($0) }.count
}


func solution2(_ n:Int) -> Int {
    
    var isPrimes: [Bool] = [Bool](repeating: true, count: n + 1)
    var count = 0
    for i in 2...n {
        if isPrimes[i] {
            count += 1
        }
        for j in 1...(n/i) {
            isPrimes[i*j] = false
        }
    }
    
    return count
}

