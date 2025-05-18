import Foundation

typealias Point = (x: Int, y: Int)

let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]


let iterator = Int(readLine()!)!

for _ in 1...iterator {
    run()
}


func run() {
    let inputs = readLine()!
        .split(separator: " ")
        .compactMap { Int($0) }
    
    let N = inputs[1] // 행
    let M = inputs[0] // 열
    let K = inputs[2] // 배추개수
    
    var board = Array(repeating: Array(repeating: 0, count: M), count: N)
    var visited = Array(repeating: Array(repeating: false, count: M), count: N)
    var result = 0
    
    
    for _ in 1...K {
        let point = readLine()!
            .split(separator: " ")
            .compactMap { Int($0) }
        let x = point[1]
        let y = point[0]
        
        board[x][y] = 1
    }
    
    for i in 0..<N {
        for j in 0..<M {
            if visited[i][j] || board[i][j] == 0 {
                continue
            }
            result += 1
            visited[i][j] = true
            bfs((i, j))
        }
    }
    
    func bfs(_ point: Point) {
        var queue: [Point] = [point]
        var index = 0
        
        while index < queue.count {
            let (x, y) = queue[index]
            index += 1
            
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if nx < 0 || ny < 0 || N <= nx || M <= ny || visited[nx][ny] || board[nx][ny] == 0 {
                    continue
                }
                
                
                visited[nx][ny] = true
                queue.append((nx, ny))
            }
        }
    }
    
    print(result)
}
