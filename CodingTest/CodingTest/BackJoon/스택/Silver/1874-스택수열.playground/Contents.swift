// https://www.acmicpc.net/problem/1874


import Foundation

func solution() {
    
    let N = Int(readLine()!)!

    var tmp = 1
    let queue = (0..<N).map { _ in Int(readLine()!)! }
    var index = 0
    
    
    var stack: [Int] = []
    var result: [String] = []
    
    while index < queue.count && tmp <= queue.count + 1 {

        if let last = stack.last, last == queue[index] {
            stack.removeLast()
            result.append("-")
            index += 1
            continue
        }
        
        stack.append(tmp)
        tmp += 1
        result.append("+")
    }
    
    if stack.isEmpty {
        result.forEach { print($0) }
    } else {
        print("NO")
    }

}


solution()

