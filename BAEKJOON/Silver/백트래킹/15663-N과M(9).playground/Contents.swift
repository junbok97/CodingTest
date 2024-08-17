// https://www.acmicpc.net/problem/15663

import Foundation


func solution() {
    
    let inputs = readLine()!
        .split(separator: " ")
        .compactMap { Int($0) }
    
    let numbers = readLine()!
        .split(separator: " ")
        .compactMap { Int($0) }
        .sorted()

    let N = inputs[0]
    let M = inputs[1]
    
    var result = ""
    var isUsed = Array(repeating: false, count: N)
    

    func backTracking(_ k: Int = 0, _ str: String = "") {
        
        if k == M {
            result += "\(str)\n"
            return
        }
        
        var tmp = 0

        for i in 0..<N {
            if isUsed[i] || tmp == numbers[i] { continue }
            isUsed[i] = true
            tmp = numbers[i]
            backTracking(k+1, str + "\(numbers[i]) ")
            isUsed[i] = false
        }
        
    }

    backTracking()
    
    print(result)

}


solution()
