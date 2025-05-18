// https://www.acmicpc.net/problem/11659

import Foundation


func solution() {
    
    let inputs = readLine()!
        .split(separator: " ")
        .compactMap { Int($0) }
    
    let N = inputs[0]
    let M = inputs[1]
    
    let numbers = readLine()!
        .split(separator: " ")
        .compactMap { Int($0) }
    
    var result = ""
    var sum = Array(repeating: 0, count: N+1)
    
    for i in 1...N {
        sum[i] = sum[i-1] + numbers[i-1]
    }
        
    for _ in 1...M {
        let inputs = readLine()!
            .split(separator: " ")
            .compactMap { Int($0) }
        
        let i = inputs[0]
        let j = inputs[1]
        
        result += "\(sum[j] - sum[i-1])\n"
    }
    
    print(result)

}


solution()

