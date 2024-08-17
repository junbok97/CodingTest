// https://www.acmicpc.net/problem/7576

import Foundation

var demessions = readLine()!
    .split(separator: " ")
    .compactMap { Int($0) }

let N = demessions.last!
let M = demessions.first!

print(bfs(N, M))


func bfs(_ N: Int, _ M: Int) -> Int {
    let dir: [(x: Int, y: Int)] = [(1, 0), (-1, 0), (0, 1), (0, -1)]
    
    var queue: [(Int, Int)] = []
    var warehouse: [[Int]] = Array(repeating: Array(repeating: 0, count: M), count: N)
    
    for i in 0..<N {
        let input = readLine()!.split(separator: " ")
        for j in 0..<input.count {
            let num = Int(input[j])!
            if num == 1 { queue.append((i, j)) }
            if num == 0 { warehouse[i][j] = -1 }
        }
    }
    
    var index = 0
    
    while index < queue.count {
        let (x, y) = queue[index]
        index += 1
        
        for idx in 0..<4 {
            let (nx, ny) = (x + dir[idx].x, y + dir[idx].y)
            
            if (0..<N ~= nx) && (0..<M ~= ny) && warehouse[nx][ny] < 0   {
                queue.append((nx, ny))
                warehouse[nx][ny] = warehouse[x][y] + 1
            }
        }
    }
    
    var answer = 0
    
    for i in 0..<N {
        for j in 0..<M {
            if warehouse[i][j] == -1 { return -1 }
            answer = max(answer, warehouse[i][j])
        }
    }
    
    return answer
}
