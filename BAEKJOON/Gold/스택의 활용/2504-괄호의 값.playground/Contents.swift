// https://www.acmicpc.net/problem/2504


import Foundation


func solution() {
    
    let inputs = readLine()!.map { String($0) }
    
    var sum = 0
    var num = 1
    var stack: [String] = []
        
    
    for index in 0..<inputs.count {
        
        if inputs[index] == "(" {
            num *= 2
            stack.append(inputs[index])
        } else if inputs[index] == "[" {
            num *= 3
            stack.append(inputs[index])
        } else if inputs[index] == ")" {
            if stack.isEmpty || stack.last! != "(" {
                print(0)
                return
            }
            
            if inputs[index-1] == "(" { sum += num }
            stack.removeLast()
            num /= 2
        } else {
            if stack.isEmpty || stack.last! != "[" {
                print(0)
                return
            }
            if inputs[index-1] == "[" { sum += num }
            stack.removeLast()
            num /= 3
        }
        
    }
    
    if stack.isEmpty {
        print(sum)
    } else {
        print(0)
    }
   
}


solution()
