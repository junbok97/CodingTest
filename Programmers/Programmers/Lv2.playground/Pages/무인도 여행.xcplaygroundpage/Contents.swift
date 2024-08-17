import Foundation

func solution(_ maps:[String]) -> [Int] {
    // (x+1, y), (x-1, y), (x, y+1), (x, y-1)
    let dx = [1, -1, 0, 0]
    let dy = [0, 0, 1, -1]
    
    // 2차원 배열로 변형
    let maps: [[String]] = maps.map { $0.map { String($0) } }
    
    // row * col
    let row = maps.count
    let col = maps[0].count
    
    var answers: [Int] = []
    var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: col), count: row)
    
    func bfs(_ i: Int, _ j:Int) {
        var queue: [(Int, Int)] = [(i, j)]
        var food = Int(maps[i][j])!
        visited[i][j] = true
        
        while !queue.isEmpty {
            let (x, y) = queue.removeFirst()
            
            for i in 0..<4 {
                let nx = x + dx[i]
                let ny = y + dy[i]
                
                if (0 <= nx && nx < row) && (0 <= ny && ny < col) && maps[nx][ny] != "X" {
                    if !visited[nx][ny] {
                        food += Int(maps[nx][ny])!
                        visited[nx][ny] = true
                        queue.append((nx,ny))
                    }
                }
            }
        }
        answers.append(food)
    }
    
    for i in 0..<row {
        for j in 0..<col {
            if maps[i][j] != "X" && !visited[i][j] {
                bfs(i, j)
            }
        }
    }
    
    return answers.isEmpty ? [-1] : answers.sorted(by: <)
}


solution(["X591X","X1X5X","X231X", "1XXX1"])
//  [1, 1, 27]
