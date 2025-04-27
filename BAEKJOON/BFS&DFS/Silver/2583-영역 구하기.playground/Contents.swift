// https://www.acmicpc.net/problem/2583
import Foundation


func solution() {
    
    let inputs = readLine()!
        .components(separatedBy: " ")
        .compactMap { Int($0) }
    
    
    let N = inputs[1]
    let M = inputs[0]
    let K = inputs[2]
    
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: M), count: N)
    var result: [Int] = []
    
    for _ in 1...K {
        
        let inputs = readLine()!
            .components(separatedBy: " ")
            .compactMap { Int($0) }

        let (lx, ly) = (inputs[0], inputs[1])
        let (rx, ry) = (inputs[2], inputs[3])
        
        
        for i in lx..<rx {
            for j in ly..<ry {
                visited[i][j] = true
            }
        }
    }
    
    
    for i in 0..<N {
        for j in 0..<M {
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
                
                if nx < 0 || ny < 0 || N <= nx || M <= ny { continue }
                if visited[nx][ny] { continue }
                
                visited[nx][ny] = true
                queue.append((nx, ny))
            }
        }
        
        
        result.append(index)
    }

    print(result.count)
    result.sorted(by: <).forEach { print($0, terminator: " ") }
}



solution()
