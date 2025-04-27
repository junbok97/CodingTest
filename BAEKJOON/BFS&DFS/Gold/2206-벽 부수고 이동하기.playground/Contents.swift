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
var distance = [
    Array(repeating: Array(repeating: -1, count: M), count: N),
    Array(repeating: Array(repeating: -1, count: M), count: N),
]
distance[0][0][0] = 1

for _ in 1...N {
    let inputs = Array(readLine()!)
    board.append(inputs)
}

print(bfs())


func bfs() -> Int{
    
    var queue: [Point] = [(0, 0, 0)]
    var index = 0
    
    while index < queue.count {
        let (x, y, isBroken) = queue[index]
        index += 1
        
        if x == N - 1 && y == M - 1 {
            return distance[isBroken][x][y]
        }
        
        let nextDistance = distance[isBroken][x][y] + 1;
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 || ny < 0 || N <= nx || M <= ny { continue }
            
            if board[nx][ny] == "0" && distance[isBroken][nx][ny] == -1 {
                distance[isBroken][nx][ny] = nextDistance
                queue.append((nx, ny, isBroken))
            }
            
            if isBroken == 0 &&  board[nx][ny] == "1"  && distance[isBroken][nx][ny] == -1 {
                distance[1][nx][ny] = nextDistance
                queue.append((nx, ny, 1))
            }
            
        }
    }
    return -1
}
