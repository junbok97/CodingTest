// https://www.acmicpc.net/problem/10799

import Foundation


func solution() {
    
    let inputs = readLine()!.map { String($0) }
    
    var result = 0
    var pipeCount = 0
    
    
    for index in 0..<inputs.count {
        if inputs[index] == "(" { pipeCount += 1 }
        
        let front = index - 1
        if front < 0 { continue }
        
        if inputs[index] == ")" && inputs[front] == "(" {
            pipeCount -= 1
            result += pipeCount
        }
        
        if inputs[index] == ")" && inputs[front] == ")" {
            pipeCount -= 1
            result += 1
        }
    }

    print(result)
}


solution()
