// https://www.acmicpc.net/problem/3986

import Foundation


func solution() {
    
    let iterator = Int(readLine()!)!
    
    var result = 0
    
    for _ in 1...iterator {
        
        let inputs = readLine()!
        
        var stack: [Character] = []
        
        
        for char in inputs {
            
            if stack.isEmpty {
                stack.append(char)
                continue
            }
            
            if char == stack.last {
                stack.removeLast()
            } else {
                stack.append(char)
            }
        }
        
        result += stack.isEmpty ? 1 : 0
    }
    
    
    print(result)
}


solution()
