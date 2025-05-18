//
//  9465 - 스티커.swift
//  CodingTest
//
//  Created by 이준복 on 5/14/25.
//

import Foundation


func solution9456() {
    let T = Int(readLine()!)!
    
    for _ in 1...T {
        let N = Int(readLine()!)!
        var a: [[Int]] = []
        var dp = Array(repeating: Array(repeating: 0, count: N), count: 2)
        a.append(readLine()!.split(separator: " ").map { Int($0)! })
        a.append(readLine()!.split(separator: " ").map { Int($0)! })
        
        for i in 0..<N {
            for j in 0..<2 {
                var v = 0
                /// 앞앞열에서 가장 큰 값
                if 1 < i { v = max(dp[0][i-2], dp[1][i-2])}
                /// 앞열 대각선에 있는 값 vs 앞앞열에서 가장 큰 값
                if 0 < i { v = max(v, dp[1-j][i-1])}
                dp[j][i] = v + a[j][i]
            }
        }
        print(max(dp[0][N-1], dp[1][N-1]))
    }
    
}

func solution9456_2() {
    var answer = [Int]()
    let T = Int(readLine()!)!
    for _ in 0..<T {
        let N = Int(readLine()!)!
        var board: [[Int]] = []
        let row1 = readLine()!.split(separator: " ").map { Int($0)! }
        let row2 = readLine()!.split(separator: " ").map { Int($0)! }
        board.append(row1)
        board.append(row2)
        
        answer.append(solution(board, N))
    }

    for ans in answer {
        print(ans)
    }

    func solution(_ board: [[Int]], _ n: Int) -> Int {
        var dp = Array(repeating: Array(repeating: 0, count: n), count: 2)
        dp[0][0] = board[0][0]
        dp[1][0] = board[1][0]

        for i in 1..<n {
            dp[0][i] = max(dp[1][i-1] + board[0][i], dp[0][i-1])
            dp[1][i] = max(dp[0][i-1] + board[1][i], dp[1][i-1])
        }

        return max(dp[0][n-1], dp[1][n-1])
    }
}

