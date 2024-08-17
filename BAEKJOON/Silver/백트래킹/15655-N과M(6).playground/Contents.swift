// https://www.acmicpc.net/problem/15655


import Foundation

func solution() {
    
    let inputs = readLine()!
        .split(separator: " ")
        .compactMap { Int($0) }
    
    let numbers = readLine()!
        .split(separator: " ")
        .compactMap { Int($0) }
        .sorted()

    let N = inputs[0]
    let M = inputs[1]
    
    var result = ""
    var stack: [String] = []
    var isUsed = Array(repeating: false, count: N)


    func backtracking(_ start: Int = 0) {
        if stack.count == M {
            result += "\(stack.joined(separator: " "))\n"
            return
        }

        for i in start..<numbers.count where !isUsed[i] {
            stack.append("\(numbers[i])")
            isUsed[i] = true
            backtracking(i + 1)
            stack.removeLast()
            isUsed[i] = false
        }
    }

    backtracking()
    print(result)

}


solution()
