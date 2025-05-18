//
//  11722-가장 긴 감소하는 부분 수열.swift
//  BAEKJOON
//
//  Created by 이준복 on 4/24/25.
//

import Foundation

func solution11722() {
    
    let N = Int(readLine()!)!
    
    let numbers = readLine()!
        .split(separator: " ")
        .compactMap { Int($0) }
    
    var dp = Array(repeating: 0, count: N)
    
    for i in 0..<N {
        for j in 0..<i {
            if numbers[i] < numbers[j] {
                dp[i] = max(dp[i], dp[j] + 1)
            }
        }
    }
    
    print(dp.max()!+1)
}

