// https://www.acmicpc.net/problem/12852

import Foundation


func solution() {
    
    let N = Int(readLine()!)!
    
    var dp = Array(repeating: 0, count: N+1)
    var pre = Array(repeating: 0, count: N+1)
    
    dp[0] = -1
    
    for i in 1...N {
        
        dp[i] = dp[i-1] + 1
        pre[i] = i-1
        
        if i % 2 == 0 && dp[i] > dp[i/2] + 1{
            dp[i] = dp[i/2] + 1
            pre[i] = i/2
        }
        
        if i % 3 == 0 && dp[i] > dp[i/3] + 1 {
            dp[i] = dp[i/3] + 1
            pre[i] = i/3
        }
    }
    
    var result = ""
    var cur = N
    
    result += "\(dp[N])\n"
    
    while true {
        result += "\(cur) "
        if cur == 1 { break }
        cur = pre[cur]
    }
    
    print(result)
    
}


solution()
