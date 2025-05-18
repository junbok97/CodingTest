// https://www.acmicpc.net/problem/15665

import Foundation


func solution() {
    
    let inputs = readLine()!
        .split(separator: " ")
        .compactMap { Int($0) }
    
    let M = inputs[1]
    
    let numbers = Array(Set(
            readLine()!
                .split(separator: " ")
                .compactMap { Int($0) }
        ))
        .sorted()
    
    let N = numbers.count
    
    
    var result = ""
    var arr = Array(repeating: 0, count: M)
    
    
    func backTracking(_ k: Int = 0) {
        
        if k == M {
            result += "\(arr.map { "\($0)" }.joined(separator: " "))\n"
            return
        }
        
        
        for i in 0..<N {
            arr[k] = numbers[i]
            backTracking(k+1)
        }
    }
    
    
    backTracking()
    print(result)
    
}


solution()
