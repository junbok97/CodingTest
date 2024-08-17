import Foundation

func solution(_ board: [[Int]]) -> Int {
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: board[0].count + 1), count: board.count + 1)
    var globalMax = 0

    for i in 1...board.count {
        for j in 1...board[0].count {
            if board[i-1][j-1] == 1 {
                dp[i][j] = min(dp[i-1][j], dp[i][j-1], dp[i-1][j-1]) + 1

                if dp[i][j] > globalMax {
                    globalMax = dp[i][j]
                }
            }
        }
    }
    
    return globalMax * globalMax
}
