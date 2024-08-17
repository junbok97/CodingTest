// https://www.acmicpc.net/problem/9012

import Foundation


func solution() {
    
    let iterator = Int(readLine()!)!
    
    for _ in 1...iterator {
        let inputs = readLine()!
        validInputs(inputs)
    }
}


func validInputs(_ inputs: String) {
    
    var stack: [Character] = []
    
    for char in inputs {
        
        if stack.isEmpty {
            stack.append(char)
            continue
        }
        
        if char == ")" && stack.last! == ")" {
            print("NO")
            return
        } else if char == ")" && stack.last! == "(" {
            stack.removeLast()
        } else {
            stack.append(char)
        }
    }
    
    print(stack.isEmpty ? "YES" : "NO")
}


solution()
