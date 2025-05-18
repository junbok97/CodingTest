// https://www.acmicpc.net/problem/15649

import Foundation

func solution() {
    
    let inputs = readLine()!
        .split(separator: " ")
        .compactMap { Int($0) }
    
    let N = inputs[0]
    let M = inputs[1]

    var arr = Array(repeating: 0, count: N + 1)
    var isused = Array(repeating: false, count: N + 1)
    backTracking(0)
    
    func backTracking(_ k: Int) {
        
        if k == M {
            var result = ""
            for i in 0..<M {
                result += "\(arr[i]) "
            }
            print(result)
            return
        }
        
        for i in 1...N {
            if !isused[i] {
                arr[k] = i
                isused[i] = true
                backTracking(k+1)
                isused[i] = false
            }
        }
        
    }
}



solution()
