import Foundation

let inputs = readLine()!
    .components(separatedBy: " ")
    .compactMap { Int($0) }

let N = inputs[0]
let M = inputs[1]
let dx = [1, -1, 0, 0]
let dy = [0, 0, 1, -1]

var boards: [[Bool]] = []

var result = 0
var count = 0


for _ in 1...N {
    let input = readLine()!
       .components(separatedBy: " ")
       .compactMap { $0 == "1" }
    boards.append(input)
}


for i in 0..<N {
    for j in 0..<M {
        if !boards[i][j] { continue }
        result = max(result, bfs(i, j))
        count += 1
    }
}

print("\(count)\n\(result)")


func bfs(_ row: Int, _ col: Int) -> Int {
    
    var queue = [(row, col)]
    var index = 0
    boards[row][col] = false
    
    while index < queue.count {
        let (x, y) = queue[index]
        index += 1
        
        for idx in 0..<4 {
            let nx = x + dx[idx]
            let ny = y + dy[idx]
            
            if (0..<N) ~= nx && (0..<M) ~= ny && boards[nx][ny] {
                boards[nx][ny] = false
                queue.append((nx, ny))
            }
        }
    }

    return index
}
