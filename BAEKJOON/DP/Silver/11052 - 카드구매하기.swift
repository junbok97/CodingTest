//
//  11052 - 카드구매하기.swift
//  BAEKJOON
//
//  Created by 이준복 on 5/5/25.
//

import Foundation

func solution11052() {
    
    let N = Int(readLine()!)!
    var dp = [0]
    dp += readLine()!
        .split(separator: " ")
        .compactMap { Int($0) }
    
    
    for i in 1...N {
        for j in 1..<i {
            dp[i] = max(dp[i-j] + dp[j], dp[i])
        }
    }
    
    print(dp[N])
}
