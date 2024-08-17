// https://www.acmicpc.net/problem/2493

import Foundation

func solution() {
    
    var stack = [(height: 100_000_001, index: 0)]
    
    let N = Int(readLine()!)!

    let inputs = readLine()!
        .split(separator: " ")
        .compactMap { Int($0) }

    
    for i in 0..<inputs.count {
        let height = inputs[i]
        
        while !stack.isEmpty && stack.last!.height < height {
            stack.removeLast()
        }
        
        print(stack.last!.index, terminator: " ")
        stack.append((height, i+1))
    }
    
}


solution()


func solution2() {
    
    let N = Int(readLine()!)!
        
    var result = 0
    var stack: [Int] = []

    
    for _ in 0..<N {
        
        let height = Int(readLine()!)!
        
        if stack.isEmpty {
            stack.append(height)
            continue
        }
        while !stack.isEmpty && stack.last! <= height {
            stack.removeLast()
        }
        
        result += stack.count
        stack.append(height)
    }
    
    print(result)
    
}

