//
//  11057 - 오르막 수.swift
//  CodingTest
//
//  Created by 이준복 on 5/18/25.
//
// 문제 링크 : https://www.acmicpc.net/problem/11057
// 알고리즘 복잡도 : N^2


import Foundation


func solution11057() {
    let mod = 10_007
    let count = 10
    let N = Int(readLine()!)!
    var dp = Array(repeating: Array(repeating: 0, count: count), count: N+1)
    
    for i in 1...N {
        dp[i][0] = 1
        for j in 1..<count {
            dp[i][j] = (dp[i][j-1] + dp[i-1][j]) % mod
        }
    }
    print(dp[N].reduce(0, +) % mod)
}
