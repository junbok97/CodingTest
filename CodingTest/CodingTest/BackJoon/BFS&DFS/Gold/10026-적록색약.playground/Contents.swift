import Foundation

typealias Point = (x: Int, y: Int)

let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]


let N = Int(readLine()!)!

var board: [[Character]] = []

for _ in 1...N {
    let inputs = Array(readLine()!)
    board.append(inputs)
}


func rgb() -> Int {
    var result = 0
    var visited = Array(repeating: Array(repeating: false, count: N), count: N)
    
    
    
    for i in 0..<N {
        for j in 0..<N {
            if visited[i][j] { continue }
            visited[i][j] = true
            bfs((i, j))
            result += 1
        }
    }
    
    
    func bfs(_ point: Point) {
        var queue = [point]
        var index = 0
        
        while index < queue.count {
            let (x, y) = queue[index]
            index += 1
            
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if nx < 0 || ny < 0 || N <= nx || N <= ny || visited[nx][ny] || board[x][y] != board[nx][ny] {
                    continue
                }
                visited[nx][ny] = true
                queue.append((nx, ny))
            }
        }
    }
    
    return result
}


func rb() -> Int {
    var result = 0
    var visited = Array(repeating: Array(repeating: false, count: N), count: N)
    
    for i in 0..<N {
        for j in 0..<N {
            if visited[i][j] { continue }
            visited[i][j] = true
            bfs((i, j))
            result += 1
        }
    }
    
    
    func bfs(_ point: Point) {
        var queue = [point]
        var index = 0
        
        while index < queue.count {
            let (x, y) = queue[index]
            index += 1
            
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if nx < 0 || ny < 0 || N <= nx || N <= ny || visited[nx][ny] {
                    continue
                }
                
                if board[x][y] != "B" && board[nx][ny] == "B" {
                    continue
                }
                
                if board[x][y] == "B" && board[nx][ny] != "B" {
                    continue
                }
                
                visited[nx][ny] = true
                queue.append((nx, ny))
            }
        }
    }

    
    return result
}

print(rgb(), rb())
