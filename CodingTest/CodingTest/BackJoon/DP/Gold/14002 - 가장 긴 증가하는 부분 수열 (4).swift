//
//  14002-가장 긴 증가하는 부분 수열4.swift
//  BAEKJOON
//
//  Created by 이준복 on 4/21/25.
//

import Foundation

func solution14002() {
    let N = Int(readLine()!)!

    let numbers = readLine()!.split(separator: " ").map { Int($0)! }
    var dp = Array(repeating: [Int](), count: N)

    
    for i in 0..<N {
        for j in 0..<i {
            if numbers[j] < numbers[i], dp[i].count < dp[j].count + 1 {
                dp[i] = dp[j] + [numbers[j]]
            }
        }
    }
    
    let (index, arr) = dp.enumerated().max(by: { $0.element.count < $1.element.count })!
    print(dp[index].count + 1)
    print((arr + [numbers[index]]).map { String($0) }.joined(separator: " "))
}
