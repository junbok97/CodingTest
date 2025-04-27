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
    
    var dp = Array(repeating: 0, count: numbers.count)
    
    for i in 0..<N {
        for j in 0..<i {
            /// i번째 보다 앞에 있으면서 자신보다 작은 수 중 가장 큰 수
            if numbers[j] > numbers[i] {
                dp[i] = max(dp[i], dp[j] + 1)
            }
        }
    }
    
    print(dp.max()!+1)
}

