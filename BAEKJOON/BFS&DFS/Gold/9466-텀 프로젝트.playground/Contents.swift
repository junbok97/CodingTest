// https://www.acmicpc.net/problem/6593

import Foundation




func solution() {
    
    
    let N = Int(readLine()!)!
    var result = N
    var visited = Array(repeating: false, count: result)
    
    let arr = readLine()!
        .components(separatedBy: " ")
        .compactMap { Int($0) }
    
    
    for i in 0..<N {
        if visited[i] { continue }
        bfs()
    }
    
    
    print(result)
}

func bfs() {
    
}


let T = Int(readLine()!)!

for _ in 1...T {
    solution()
}





