//
//  9095 - 1,2,3 더하기.swift
//  BAEKJOON
//
//  Created by 이준복 on 5/1/25.
//

import Foundation


func solution9095() {
    
    let MAX = 11
    let T = Int(readLine()!)!
    
    var dp = Array(repeating: 0, count: MAX)
    
    dp[1] = 1
    dp[2] = 2
    dp[3] = 4
    
    for i in 4..<MAX {
        dp[i] = dp[i-3] + dp[i-2] + dp[i-1]
    }
    
    for _ in 0..<T {
        let N = Int(readLine()!)!
        print(dp[N])
    }
 
}
