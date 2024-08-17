// https://www.acmicpc.net/problem/1012
import Foundation

var testCaseCount = Int(readLine()!)!
    

for _ in 1...testCaseCount {
    solution()
}

func solution() {
    let inputs = readLine()!
        .components(separatedBy: " ")
        .compactMap { Int($0) }
    
    let N = inputs[0]
    let M = inputs[1]
    let CabbageCount = inputs[2]
    
    var count = 0
    var board = Array(repeating: Array(repeating: 0, count: M), count: N)
    var visited = Array(repeating: Array(repeating: false, count: M), count: N)
    
    for _ in 1...CabbageCount {
        let input = readLine()!
            .components(separatedBy: " ")
            .compactMap { Int($0) }
        
        let (x, y) = (input.first!, input.last!)
        board[x][y] = 1
    }
    
    for i in 0..<N {
        for j in 0..<M {
            if board[i][j] == 1 && !visited[i][j] {
                bfs(i, j)
                count += 1
            }
        }
    }
    
    print(count)
    
    func bfs(_ i: Int, _ j: Int) {
        let dx = [1, -1, 0, 0]
        let dy = [0, 0, 1, -1]
        
        visited[i][j] = true
        var queue = [(i, j)]
        
        while !queue.isEmpty {
            let (x, y) = queue.removeFirst()
            
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if nx < 0 || nx >= N || ny < 0 || ny >= M { continue }
                if visited[nx][ny] || board[nx][ny] == 0 { continue }
                visited[nx][ny] = true
                queue.append((nx, ny))
            }
        }
    }
    
    
}



