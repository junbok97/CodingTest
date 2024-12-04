import Foundation

typealias Point = (x: Int, y: Int, isBroken: Int)

let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]


let input = readLine()!
    .split(separator: " ")
    .compactMap { Int($0) }

let N = input[0]
let M = input[1]

var board: [[Character]] = []
var visited = Array(repeating: Array(repeating: Array(repeating: false, count: M), count: N), count: 2)
visited[0][0][0] = true
visited[1][0][0] = true

for _ in 1...N {
    let inputs = Array(readLine()!)
    board.append(inputs)
}


print(bfs())


func bfs() -> Int{
    
    
    var time = 0
    var queue: [Point] = [(0, 0, 0)]
    var index = 0
    
    while index < queue.count {
        let (x, y, isBroken) = queue[index]
        visited[isBroken][x][y] = true
        
        print("======vistied 0======")
        print(visited[0].map {
            $0.map { String($0) }.joined(separator: " ") }.joined(separator: "\n"))
        print("======vistied 1======")
        print(visited[1].map {
            $0.map { String($0) }.joined(separator: " ") }.joined(separator: "\n"))
        
        print("============")
        
        index += 1
        time += 1
        
        if x == N - 1 && y == M - 1 {
            return time
        }
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 || ny < 0 || N <= nx || M <= ny || visited[isBroken][nx][ny] { continue }
            
            if board[nx][ny] == "0" {
                visited[isBroken][nx][ny] = true
                if isBroken == 0 {
                    visited[1][nx][ny] = true
                }
                queue.append((nx, ny, isBroken))
            } else if board[nx][ny] == "1" && isBroken == 0 {
                visited[1][nx][ny] = true
                queue.append((nx, ny, 1))
            }
        }
    }
    
    return -1
}

