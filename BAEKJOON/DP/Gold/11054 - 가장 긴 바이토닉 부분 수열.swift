//
//  11054-가장 긴 바이토닉 부분 수열.swift
//  BAEKJOON
//
//  Created by 이준복 on 4/24/25.
//

import Foundation

func solution11054() {
    let N = Int(readLine()!)!
    
    let numbers = readLine()!
        .split(separator: " ")
        .compactMap { Int($0) }
    
    var increase = Array(repeating: 1, count: N)
    var decrease = Array(repeating: 1, count: N)
    
    
    for i in 0..<N {
        for j in 0..<i {
            if numbers[j] < numbers[i] {
                increase[i] = max(increase[i], increase[j] + 1)
            }
            if numbers[N-1-j] < numbers[N-1-i] {
                decrease[N-1-i] = max(decrease[N-1-i], decrease[N-1-j] + 1)
            }
        }
    }
    
    print(zip(increase, decrease).map({ $0 + $1 }).max()!-1)
}
