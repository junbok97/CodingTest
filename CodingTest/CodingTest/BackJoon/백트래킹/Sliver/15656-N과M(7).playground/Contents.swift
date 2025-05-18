// https://www.acmicpc.net/problem/15656


import Foundation

func solution() {
    
    let inputs = readLine()!
        .split(separator: " ")
        .compactMap { Int($0) }
    
    let numbers = readLine()!
        .split(separator: " ")
        .compactMap { Int($0) }
        .sorted()

    let M = inputs[1]
    
    var result = ""
    var stack: [String] = []


    func backtracking(_ start: Int = 0) {
        
        if stack.count == M {
            result += "\(stack.joined(separator: " "))\n"
            return
        }

        for i in 0..<numbers.count {
            stack.append("\(numbers[i])")
            backtracking(i + 1)
            stack.removeLast()
        }
        
    }

    backtracking()
    print(result)

}


solution()
