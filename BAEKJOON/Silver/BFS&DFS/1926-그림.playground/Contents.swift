import Foundation

var inputs = readLine()!.components(separatedBy: " ").compactMap { Int($0) }
let row = inputs.first!
let col = inputs.last!

let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

var mx = 0
var num = 0
var boards: [[Bool]] = []

for _ in 0..<row {
    let inputs: [Bool] = readLine()!.components(separatedBy: " ").map { $0 == "1" }
    boards.append(inputs)
}

for i in 0..<row {
    for j in 0..<col {
        if !boards[i][j] { continue }
        num += 1
        mx = max(mx, bfs(i, j))
    }
}

print(num)
print(mx)



func bfs(_ i: Int, _ j: Int) -> Int {
    var area = 0
    var queue: [(Int, Int)] = []
    
    boards[i][j] = false
    queue.append((i,j))
    
    while !queue.isEmpty {
        area += 1
        let (x, y) = queue.removeFirst()
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if (nx < 0 || row <= nx || ny < 0 || col <= ny) || !boards[nx][ny] { continue }
            
            boards[nx][ny] = false
            queue.append((nx, ny))
        }
    }
    
    return area
}
