// https://www.acmicpc.net/problem/1463

import Foundation


func solution() {
    
    let N = Int(readLine()!)!
    
    var dp = Array(repeating: 0, count: N+1)
    dp[0] = -1
    
    for i in 1...N {
        dp[i] = dp[i-1] + 1
        if i % 3 == 0 { dp[i] = min(dp[i], dp[i/3] + 1) }
        if i % 2 == 0 { dp[i] = min(dp[i], dp[i/2] + 1) }
    }
    
    print(dp[N])
}


solution()
