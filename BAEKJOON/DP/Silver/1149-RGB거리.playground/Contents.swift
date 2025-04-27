// https://www.acmicpc.net/problem/1149

import Foundation


func solution() {
    
    let N = Int(readLine()!)!
    
    var r = Array(repeating: 0, count: N)
    var g = Array(repeating: 0, count: N)
    var b = Array(repeating: 0, count: N)
    var dp = Array(repeating: Array(repeating: 0, count: 3), count: N)
    
    for i in 0..<N {
        let inputs = readLine()!
            .split(separator: " ")
            .compactMap { Int($0) }
        
        r[i] = inputs[0]
        g[i] = inputs[1]
        b[i] = inputs[2]
    }
    
    dp[0][0] = r[0]
    dp[0][1] = g[0]
    dp[0][2] = b[0]
    
    for i in 1..<N {
        dp[i][0] = min(dp[i-1][1], dp[i-1][2]) + r[i]
        dp[i][1] = min(dp[i-1][0], dp[i-1][2]) + g[i]
        dp[i][2] = min(dp[i-1][0], dp[i-1][1]) + b[i]
    }
    
    
    print(min(dp[N-1][0], dp[N-1][1], dp[N-1][2]))
}


solution()
