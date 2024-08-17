// https://www.acmicpc.net/problem/15651

import Foundation

func solution() {
    
    let inputs = readLine()!
        .split(separator: " ")
        .compactMap { Int($0) }
    
    let N = inputs[0]
    let M = inputs[1]
    
    var result = ""
    backTracking(0, "")
    print(result)
    
    func backTracking(_ k: Int, _ str: String) {
        
        if k == M {
            result += "\(str)\n"
            return
        }
        
        for i in 1...N {
            backTracking(k+1, str + "\(i) ")
        }
    }
    
}

solution()
