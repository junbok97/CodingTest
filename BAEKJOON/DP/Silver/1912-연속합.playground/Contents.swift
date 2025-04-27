// https://www.acmicpc.net/problem/1912

import Foundation

func solution() {
    
    let N = Int(readLine()!)!
    
    let numbers = readLine()!
        .split(separator: " ")
        .compactMap { Int($0) }
    
    var dp = Array(repeating: -1000, count: N+1)
    dp[0] = numbers[0]
    
    for i in 1..<N {
        dp[i] = max(0, dp[i-1]) + numbers[i]
    }
    
    print(dp.max()!)
}


solution()
