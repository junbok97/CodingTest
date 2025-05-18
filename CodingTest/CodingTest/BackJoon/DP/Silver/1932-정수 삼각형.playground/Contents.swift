// https://www.acmicpc.net/problem/1932

import Foundation


func solution() {
    
    let N = Int(readLine()!)!
    
    var arr: [[Int]] = []
    var dp: [[Int]] = Array(repeating: Array(repeating: 0, count: N), count: N)
    
    (1...N).forEach { _ in
        let numbers = readLine()!
            .split(separator: " ")
            .compactMap { Int($0) }
        
        arr.append(numbers)
    }
    
    dp[0][0] = arr[0][0]
    
    for i in 0..<N-1 {
        for j in 0...i {
            dp[i+1][j] = max(dp[i+1][j], dp[i][j] + arr[i+1][j])
            dp[i+1][j+1] = max(dp[i+1][j+1], dp[i][j] + arr[i+1][j+1])
        }
    }

    print(dp[N-1].max()!)
    
}


solution()
