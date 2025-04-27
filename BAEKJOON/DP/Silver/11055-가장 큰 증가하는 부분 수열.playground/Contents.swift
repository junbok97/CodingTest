// https://www.acmicpc.net/problem/11055

import Foundation

func solution() {
    
    let N = Int(readLine()!)!
    
    let numbers = readLine()!
        .split(separator: " ")
        .compactMap { Int($0) }
    
    var dp = numbers
    
    /// i번째 보다 앞에 있으면서 가장 큰 수
    for i in 0..<N {
        for j in 0..<i {
            if numbers[j] < numbers[i] {
                dp[i] = max(dp[i], dp[j] + numbers[i])
            }
        }
        print(dp)
    }
    
    print(dp.max()!)
}


solution()
