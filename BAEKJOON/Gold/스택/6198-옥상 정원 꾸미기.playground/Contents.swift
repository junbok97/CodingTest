// https://www.acmicpc.net/problem/6198

import Foundation

func solution() {
    
    let N = Int(readLine()!)!

    var result = Array(repeating: 0, count: N)
    var stack = [(height: 1_000_000_001, index: 0)]
    var answer = 0
    
    
    let inputs = (1...N).map { _ in Int(readLine()!)! }
    

    for i in 1...N {
        
        let index = N - i
        let height = inputs[index]
        
        
        var count = 0
        
        while stack.last!.height < height {
            let (_, j) = stack.removeLast()
            count += result[j] + 1
        }
        
        result[index] = count
        answer += count
        stack.append((height, index))
    }
    
    print(answer)
    
}

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

solution()




