import Foundation

var inputs = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
let N = inputs.first!
let M = inputs.last!

var boards: [[Bool]] = []

for _ in 0..<N {
    let inputs: [Bool] = readLine()!.map { $0 == "1" }
    boards.append(inputs)
}

print(bfs(N, M))

func bfs(_ row: Int, _ col: Int) -> Int {

    let dx = [1, 0, -1, 0]
    let dy = [0, 1, 0, -1]
    
    var queue: [(Int, Int)] = []
    var dist = Array(repeating: Array(repeating: -1, count: col), count: row)

    dist[0][0] = 1
    queue.append((0,0))

    while !queue.isEmpty {
        let (x, y) = queue.removeFirst()
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if (nx < 0 || row <= nx || ny < 0 || col <= ny) ||
                dist[nx][ny] >= 0 ||
                !boards[nx][ny] { continue }
            
            dist[nx][ny] = dist[x][y] + 1
            queue.append((nx, ny))
        }
    }
    
    return dist[row-1][col-1]
}
