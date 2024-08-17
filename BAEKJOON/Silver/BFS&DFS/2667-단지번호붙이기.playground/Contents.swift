// https://www.acmicpc.net/problem/2667

import Foundation


func solution() {
    
    let N = Int(readLine()!)!

    var block = 0
    var result: [Int] = []
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: N), count: N)
    var apartmentBoard: [[Int]] = []

    
    for _ in 1...N {
        
        let inputs = readLine()!
            .compactMap { Int(String($0)) }

        apartmentBoard.append(inputs)
    }
    
    for i in 0..<N {
        for j in 0..<N {
            if apartmentBoard[i][j] == 0 {
                visited[i][j] = true
                continue
            }
            if visited[i][j] { continue }
            bfs(i, j)
        }
    }
    
    
    func bfs(_ i: Int, _ j: Int) {
        
        let dx = [1, -1, 0, 0]
        let dy = [0, 0, 1, -1]
        
        var index = 0
        var queue: [(Int, Int)] = []
        queue.append((i, j))
        visited[i][j] = true
        
        while index < queue.count {
            
            let (x, y) = queue[index]
            index += 1
            
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if nx < 0 || ny < 0 || N <= nx || N <= ny { continue }
                if visited[nx][ny] || apartmentBoard[nx][ny] == 0 { continue }
                
                visited[nx][ny] = true
                queue.append((nx, ny))
            }
        }

        result.append(index)
        block += 1
    }

    
    print(block)
    result.sorted(by: <)
        .forEach { print($0) }
}



solution()
