// https://www.acmicpc.net/problem/4949

import Foundation


func solution() {
    
    while let inputs = readLine(), inputs != "." {
        
        var stack: [Character] = []
        
        for char in inputs {
            
            if !["[", "]", "(", ")"].contains(char) { continue }
            
            if char == "]" && stack.last == "[" {
                stack.removeLast()
            } else if char == ")" && stack.last == "(" {
                stack.removeLast()
            } else {
                stack.append(char)
            }
        }
        
        print(stack.isEmpty ? "yes" : "no")
    }
    
}


solution()
