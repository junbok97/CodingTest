// https://www.acmicpc.net/problem/2579

import Foundation


func solution() {
    
    
    let N = Int(readLine()!)!
    
    var dp = Array(repeating: Array(repeating: 0, count: 3), count: N+1)
    
    for i in 1...N {
        dp[i][0] = Int(readLine()!)!
    }
    
    dp[1][1] = dp[1][0]
    dp[1][2] = 0
    
    if N == 1 {
        print(dp[1][0])
        return
    }
    
    for i in 2...N {
        dp[i][1] = max(dp[i-2][1], dp[i-2][2]) + dp[i][0]
        dp[i][2] = dp[i-1][1] + dp[i][0]
    }
    
    print(max(dp[N][1], dp[N][2]))
}


solution()
