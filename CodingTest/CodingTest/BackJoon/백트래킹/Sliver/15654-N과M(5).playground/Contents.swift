// https://www.acmicpc.net/problem/15654

import Foundation

func solution() {
    
    let inputs = readLine()!
        .split(separator: " ")
        .compactMap { Int($0) }
    
    let sequence = readLine()!
        .split(separator: " ")
        .compactMap { Int($0) }
        .sorted()
    
    let N = inputs[0]
    let M = inputs[1]

    var result = ""
    var isUsed = Array(repeating: false, count: N)
    
    backTraking(0, "")
    print(result)
    
    func backTraking(_ k: Int, _ str: String) {
        
        if k == M {
            result += "\(str)\n"
            return
        }
        
        for i in 0..<N {
            if isUsed[i] { continue }
            isUsed[i] = true
            backTraking(k + 1, str + "\(sequence[i]) ")
            isUsed[i] = false
        }
        
    }
    
}


solution()
