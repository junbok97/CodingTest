//
//  2748-피보나치 수2.swift
//  BAEKJOON
//
//  Created by 이준복 on 4/24/25.
//

import Foundation


func solution2748() -> Int {
    
    let N = Int(readLine()!)!
    
    var dp = Array(repeating: 0, count: N+3)
    dp[1] = 1
    dp[2] = 1

    if N < 2 {
        return dp[N]
    }
    
    for i in 2...N {
        dp[i] = dp[i-1] + dp[i-2]
    }
    
    return dp[N]
}



