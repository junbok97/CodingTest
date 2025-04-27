//
//  2204-자두나무.swift
//  BAEKJOON
//
//  Created by 이준복 on 4/21/25.
//

import Foundation

func solution2204() {
    let inputs = readLine()!
        .split(separator: " ")
        .compactMap{ Int($0) }

    let (T, W) = (inputs[0], inputs[1])

    var apple = Array(repeating: 0, count: T+1)

    for i in 1...T {
        apple[i] = Int(readLine()!)!
    }

    var dp: [[Int]] = Array(
        repeating: Array(repeating: 0, count: W+1),
        count: T+1
    )

    for i in 1...T {
        /// 1번 나무에서 안움직였다면 i초에 먹는 자두의 수
        dp[i][0] = dp[i-1][0] + (apple[i] == 1 ? 1 : 0)
        
        /// i초에서
        /// 0번부터  W번까지 움직였을때
        /// j번째 움직였을 때 먹을 수 있는
        /// 최대 자두의 수
        
        for j in 1...W {
            /// 1번나무에서 시작해서
            /// 움직인다고 가정하면
            /// 2번 자두 획득
            let increment = ((j % 2 == apple[i] - 1) ? 1 : 0)
            
            /// i-1번초에서
            /// 현재위치에서 움직일때, 움직이지 않을 때
            let max = max(dp[i-1][j-1], dp[i-1][j])
            dp[i][j] = max + increment
        }
        print(dp)
    }

    print(dp[T].max()!)
}
