// https://www.acmicpc.net/problem/2468

import Foundation


func solution() {
    
    let dx = [1, -1, 0, 0]
    let dy = [0, 0, 1, -1]
    
    let N = Int(readLine()!)!
    
    var max = 0
    var board: [[Int]] = []
    var result: [Int] = []
    
    for _ in 1...N {
        
        let inputs = readLine()!
            .components(separatedBy: " ")
            .compactMap { Int($0) }
        
        let nexMax = inputs.max()!
        
        board.append(inputs)
        max = nexMax > max ? nexMax : max
    }
    
    
    for height in 1..<max {
        
        var area = 0
        var visited = Array(repeating: Array(repeating: false, count: N), count: N)
        
        for i in 0..<N {
            for j in 0..<N {
                
                if visited[i][j] || board[i][j] <= height { continue }
                visited[i][j] = true
                
                var queue: [(Int, Int)] = [(i, j)]
                var index = 0
                
                while index < queue.count {
                    
                    let (x, y) = queue[index]
                    index += 1
                    
                    
                    for dir in 0..<4 {
                        let nx = x + dx[dir]
                        let ny = y + dy[dir]
                        
                        if !(0..<N ~= nx) || !(0..<N ~= ny) { continue }
                        if visited[nx][ny] || board[nx][ny] <= height { continue }
                        
                        
                        visited[nx][ny] = true
                        queue.append((nx, ny))
                    }
                }
                area += 1
            }
        }
        
        result.append(area)
    }
        
    print(result.max() ?? 1)
    
}


solution()
