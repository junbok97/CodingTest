// https://www.acmicpc.net/problem/14501

import Foundation


func solution() {
    
    let N = Int(readLine()!)!
    
    var t: [Int] = []
    var p: [Int] = []
    var d: [Int] = Array(repeating: 0, count: N+5)
    
    for _ in 1...N {
        let inputs = readLine()!
            .split(separator: " ")
            .compactMap { Int($0) }
        
        t.append(inputs[0])
        p.append(inputs[1])
    }
    
    for i in (0..<N).reversed() {
        if i + t[i] < N + 1 {
            d[i] = max(d[i + t[i]] + p[i], d[i + 1])
        } else {
            d[i] = d[i + 1]
        }
    }
    
    print(d.max()!)
    
}


solution()
