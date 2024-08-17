// https://www.acmicpc.net/problem/9461

import Foundation

func solution() {
    
    let N = Int(readLine()!)!
    
    var result = ""
    var dp = Array(repeating: 0, count: 104)
    
    dp[1] = 1
    dp[2] = 1
    dp[3] = 1
    
    for i in 4..<104 {
        dp[i] = dp[i-2] + dp[i-3]
    }
    
    for _ in 1...N {
        let K = Int(readLine()!)!
        result += "\(dp[K])\n"
    }
    
    print(result)
}


solution()
