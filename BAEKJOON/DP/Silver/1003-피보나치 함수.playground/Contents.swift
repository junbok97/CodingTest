// https://www.acmicpc.net/problem/1003

import Foundation


func solution() {
    
    let N = Int(readLine()!)!
    
    var result = ""
    
    for _ in 1...N {
        
        let K = Int(readLine()!)!
        
        var dp = Array(repeating: Array(repeating: 0, count: 3), count: K+2)
        dp[0][0] = 1
        dp[1][1] = 1
        dp[1][2] = 1
        
        if K < 2 {
            result += "\(dp[K][0]) \(dp[K][1])\n"
            continue
        }
        
        for i in 2...K {
            dp[i][0] = dp[i-1][0] + dp[i-2][0]
            dp[i][1] = dp[i-1][1] + dp[i-2][1]
            dp[i][2] = dp[i-1][2] + dp[i-2][2]
        }
        
        result += "\(dp[K][0]) \(dp[K][1])\n"
    }
    
    
    print(result)
    
}


solution()
