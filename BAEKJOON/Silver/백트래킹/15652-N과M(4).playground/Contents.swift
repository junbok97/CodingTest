// https://www.acmicpc.net/problem/15652

import Foundation

let inputs = readLine()!
    .components(separatedBy: " ")
    .compactMap { Int($0) }

let N = inputs[0]
let M = inputs[1]


var arr = Array(repeating: 0, count: M)
var result = ""


backTraking(0, start: 1)
print(result)


func backTraking(_ k: Int, start: Int) {

    if k == M {
        result += arr.map(String.init).joined(separator: " ") + "\n"
        return
    }
 
    for i in start...N {
        arr[k] = i
        backTraking(k+1, start: i)
    }
    
    
}
