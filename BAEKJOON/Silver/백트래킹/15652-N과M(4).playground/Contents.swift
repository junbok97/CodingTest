// https://www.acmicpc.net/problem/15652

import Foundation

func solution() {
    
    let inputs = readLine()!
        .split(separator: " ")
        .compactMap { Int($0) }
    
    let N = inputs[0]
    let M = inputs[1]

    var result = ""
    var arr = Array(repeating: 0, count: M)
    
    backTraking(0)
    print(result)
    
    func backTraking(_ k: Int) {
        
        if k == M {
            result += "\(arr.map(String.init).joined(separator: " "))\n"
            return
        }
        
        for i in 1...N {
            if k == 0 {
                arr[k] = i
                backTraking(k + 1)
            } else {
                if arr[k-1] > i { continue }
                arr[k] = i
                backTraking(k + 1)
            }
        }
        
    }
    
}


solution()
