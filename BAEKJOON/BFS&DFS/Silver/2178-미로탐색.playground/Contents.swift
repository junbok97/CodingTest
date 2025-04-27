// https://www.acmicpc.net/problem/2178

import Foundation

let inputs = readLine()!
    .components(separatedBy: " ")
    .compactMap { Int($0) }

let N = inputs[0]
let M = inputs[1]
let dx = [1, -1, 0, 0]
let dy = [0, 0, 1, -1]

var boards: [[Bool]] = []

for _ in 1...N {
    let input = readLine()!.map { $0 == "1" }
    boards.append(input)
}


var dist = Array(repeating: Array(repeating: -1, count: M), count: N)
var queue = [(0,0)]
var index = 0


dist[0][0] = 1

while index < queue.count {
    let (x, y) = queue[index]
    index += 1
    
    for idx in 0..<4 {
        let nx = x + dx[idx]
        let ny = y + dy[idx]
        
        if (0..<N) ~= nx && (0..<M) ~= ny && boards[nx][ny] && dist[nx][ny] < 0 {
            dist[nx][ny] = dist[x][y] + 1
            queue.append((nx, ny))
        }
    }
}


print(dist[N-1][M-1])
