// https://www.acmicpc.net/problem/15650
import Foundation

let inputs = readLine()!
    .components(separatedBy: " ")
    .compactMap { Int($0) }

let N = inputs[0]
let M = inputs[1]

var isUsed = Array(repeating: false, count: N)
var arr = Array(repeating: 0, count: M)


backTraking(0, -1)

func backTraking(_ k: Int, _ front: Int) {
    if k == M {
        var answer = ""
        for i in 0..<M {
            answer += "\(arr[i]) "
        }
        print(answer)
        return
    }
    
    
    for i in k..<N {
        if isUsed[i] || i+1 <= front { continue }
        isUsed[i] = true
        arr[k] = i+1
        backTraking(k+1, i+1)
        isUsed[i] = false
    }
}
