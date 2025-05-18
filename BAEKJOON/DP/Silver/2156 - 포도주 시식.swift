//
//  2156-포도주 시식.swift
//  BAEKJOON
//
//  Created by 이준복 on 5/1/25.
//

import Foundation

func solution2156() {
    let N = Int(readLine()!)!
    var inputs = Array(repeating: 0, count: N+1)
    var dp = Array(repeating: Array(repeating: 0, count: 3), count: N+1)
    
    for i in 1...N {
        inputs[i] = Int(readLine()!)!
    }
    
    if N == 1 {
        print(inputs[1])
        return
    }
    
    dp[1][1] = inputs[1]
    
    for i in 2...N {
        /// 안마실 경우
        dp[i][0] = max(dp[i-1][0], dp[i-1][1], dp[i-1][2])
        /// 첫번째 잔인 경우
        dp[i][1] = dp[i-1][0] + inputs[i]
        /// 두번째 잔인 경우
        dp[i][2] = dp[i-1][1] + inputs[i]
    }
    
    
    print(max(dp[N][0], dp[N][1], dp[N][2]))
}
