//
//  2302 - 극장좌석.swift
//  BAEKJOON
//
//  Created by 이준복 on 5/1/25.
//

import Foundation


func solution2302() {
    
    var dp = Array(repeating: 0, count: 41)
    
    dp[0] = 1
    dp[1] = 1
    dp[2] = 2
    
    for i in 3...40 {
        dp[i] = dp[i-1] + dp[i-2]
    }

    
    let N = Int(readLine()!)!
    let M = Int(readLine()!)!
    
    var k = 0
    var ans = 1

    for _ in 0..<M {
        let num = Int(readLine()!)!
        
        ans *= dp[num-k-1]
        k = num
    }

    ans *= dp[N-k]
    print(ans)
}
