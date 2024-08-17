// https://www.acmicpc.net/problem/10773

import Foundation

func solution() {
    
    let N = Int(readLine()!)!
    
    var stack: [Int] = []
    
    (0..<N).forEach { _ in
        let input = Int(readLine()!)!
            
        if input == 0 {
            stack.popLast()
        } else {
            stack.append(input)
        }
    }
    
    print(stack.reduce(0, +))

}


solution()
