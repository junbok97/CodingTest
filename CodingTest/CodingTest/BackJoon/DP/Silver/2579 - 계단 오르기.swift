//
//  2579-계단 오르기.swift
//  2579-계단 오르기
//
//  Created by 이준복 on 5/1/25.
//

import Foundation


func solution2579_A() {
    let N = Int(readLine()!)!
    var inputs = Array(repeating: 0, count: 301)
    var dp = Array(repeating: 0, count: 301)
    
    for i in 1...N {
        inputs[i] = Int(readLine()!)!
    }
    
    dp[1] = inputs[1]
    dp[2] = inputs[2] + inputs[1]
    dp[3] = inputs[3] + max(inputs[2], inputs[1])
    
    if N <= 3 {
        print(dp[N])
        return
    }
    
    for i in 4...N {
        dp[i] = inputs[i] + max(inputs[i-1] + dp[i-3], dp[i-2])
    }
    
    print(dp[N])
}

func solution2579_B() {
    let N = Int(readLine()!)!

    var dp = Array(repeating: Array(repeating: 0, count: 3), count: N+1)

    for i in 1...N {
        dp[i][0] = Int(readLine()!)!
    }

    dp[1][1] = dp[1][0]
    dp[1][2] = 0

    if N == 1 {
        print(dp[1][0])
        return
    }

    for i in 2...N {
        dp[i][1] = max(dp[i-2][1], dp[i-2][2]) + dp[i][0]
        dp[i][2] = dp[i-1][1] + dp[i][0]
    }

    print(max(dp[N][1], dp[N][2]))
}
