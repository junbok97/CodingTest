// https://www.acmicpc.net/problem/15657

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
    

    func backTracking(_ start: Int = 0, _ k: Int = 0, _ str: String = "") {
        
        if k == M {
            result += "\(str)\n"
            return
        }

        for i in start..<N {
            backTracking(i, k+1, str + "\(numbers[i]) ")
        }
        
    }

    backTracking()
    print(result)

}


solution()
