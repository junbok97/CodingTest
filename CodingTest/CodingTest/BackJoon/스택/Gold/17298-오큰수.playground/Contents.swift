// https://www.acmicpc.net/problem/17298

import Foundation

func solution() {
    
    let N = Int(readLine()!)!
    let inputs = readLine()!.split(separator: " ")
    
    var stack: [Int] = []
    var arr = Array(repeating: 0, count: N)
    
    
    for i in 1...N {
        let index = N-i
        let input = Int(inputs[index])!

        while !stack.isEmpty, stack.last! <= input {
            stack.removeLast()
        }
        
        if stack.isEmpty {
            arr[index] = -1
        } else {
            arr[index] = stack.last!
        }
        
        stack.append(input)
    }
    
    var result = ""
    
    arr.forEach { result += "\($0) " }

    print(result)
    
}


solution()

