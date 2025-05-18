// https://www.acmicpc.net/problem/10828

import Foundation

func solution() {
    
    let N = Int(readLine()!)!
    
    var stack: [Int] = []
    
    (0..<N).forEach { _ in
        let input = readLine()!
            .split(separator: " ")
        
        let mod  = input[0]
        
        switch mod {
        case "push" :
            stack.append(Int(input[1])!)
        case "pop":
            print(stack.popLast() ?? -1)
        case "size":
            print(stack.count)
        case "empty":
            print(stack.isEmpty ? 1 : 0)
        case "top":
            print(stack.last ?? -1)

        default:
            break
        }
    }

}


solution()

