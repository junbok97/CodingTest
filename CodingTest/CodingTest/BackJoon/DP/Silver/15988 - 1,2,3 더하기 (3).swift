//
//  15988 - 1,2,3 더하기 (3).swift
//  BAEKJOON
//
//  Created by 이준복 on 5/1/25.
//

import Foundation


func solution15988() {
    
    let T = Int(readLine()!)!
    var dp = Array(repeating: 0, count: 1_000_001)
    
    dp[1] = 1
    dp[2] = 2
    dp[3] = 4
    
    for i in 4...1_000_000 {
        dp[i] = (dp[i-1] + dp[i-2] + dp[i-3]) % 1_000_000_009
    }
    
    for _ in 1...T {
        let n = Int(readLine()!)!
        print(dp[n])
    }
}

