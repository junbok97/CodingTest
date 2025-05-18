// https://www.acmicpc.net/problem/10844

import Foundation


func solution() {
    let N = Int(readLine()!)!
    
    
    if N == 1 {
        print("9")
        return
    }
    
    var dp = Array(repeating: Array(repeating: 0, count: 10), count: N+1)
    
    for i in 1..<10 {
        dp[1][i] = 1
    }
    
    for i in 2...N {
        for k in 0..<10 {
            
            if k != 0 {
                dp[i][k] += dp[i-1][k-1]
            }
            if k != 9 {
                dp[i][k] += dp[i-1][k+1]
            }
            dp[i][k] %= 1_000_000_000
        }
    }
    
    print(dp[N].reduce(0, +) % 1_000_000_000)
}


solution()
