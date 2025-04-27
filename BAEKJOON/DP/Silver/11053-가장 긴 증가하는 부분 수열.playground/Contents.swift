// https://www.acmicpc.net/problem/11053

import Foundation

func solution() {
    
    let N = Int(readLine()!)!
    
    let numbers = readLine()!
        .split(separator: " ")
        .compactMap { Int($0) }
    
    var dp = Array(repeating: 1, count: N+1)
    
    for i in 1..<N {
        for j in 0..<i {
            if numbers[j] < numbers[i] {
                dp[i] = max(dp[i], dp[j] + 1)
            }
        }
    }
    
    print(dp.max()!)
}


solution()
