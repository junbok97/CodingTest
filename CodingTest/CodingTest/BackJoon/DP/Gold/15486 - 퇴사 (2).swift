//
//  15486-퇴사2.swift
//  BAEKJOON
//
//  Created by 이준복 on 4/27/25.
//

import Foundation


func soulution15486() {
    
    let N = Int(readLine()!)!

    var inputs: [(time: Int, pay: Int)] = Array(repeating: (0,0), count: N+2)
    var dp = Array(repeating: 0, count: N+2)


    for i in 1...N {
        let input = readLine()!
            .split(separator: " ")
            .compactMap { Int($0) }
        inputs[i] = (input[0], input[1])
    }



    for i in stride(from: N, through: 1, by: -1) {
        
        let (time, pay) = inputs[i]
        
        if time + i <= N + 1 {
            dp[i] = max(dp[time+i] + pay, dp[i+1])
        } else {
            dp[i] = dp[i+1]
        }
        
    }


    print(dp[1])
}

