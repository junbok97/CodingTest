// https://www.acmicpc.net/problem/10026

import Foundation

let RED = "R"
let GREEN = "G"
let BLUE = "B"

var boardRGB: [[String]] = []
var boardRB: [[String]] = []

final class BFS {

    private let dx = [1, -1, 0, 0]
    private let dy = [0, 0, 1, -1]
    private let board: [[String]]
    
    private var visited: [[Bool]]
    
    private(set) var result = 0
    
    init(n: Int, board: [[String]]) {
        self.board = board
        self.visited = Array(repeating: Array(repeating: false, count: n), count: n)
    }
    
    func run(_ i: Int, _ j: Int) {
        if visited[i][j] { return }
        bfs(i, j)
        result += 1
    }
    
    private func bfs(_ i: Int, _ j: Int) {
        visited[i][j] = true
        var queue = [(i,j)]
        
        while !queue.isEmpty {
            let (x, y) = queue.removeFirst()
            
            for idx in 0..<4 {
                let nx = x + dx[idx]
                let ny = y + dy[idx]
                
                if nx < 0 || nx >= N || ny < 0 || ny >= N ||
                    visited[nx][ny] ||
                    board[x][y] != board[nx][ny] { continue }
                visited[nx][ny] = true
                queue.append((nx, ny))
            }
        }
    }
    
}

let N = Int(readLine()!)!
for _ in 1...N {
    let inputs = readLine()!
    
    boardRGB.append(inputs
        .map{ String($0) }
    )
    
    boardRB.append(inputs
        .replacingOccurrences(of: GREEN, with: RED)
        .map{ String($0) }
    )
}

let bfsRGB = BFS(n: N, board: boardRGB)
let bfsRB = BFS(n: N, board: boardRB)


for i in 0..<N {
    for j in 0..<N {
        bfsRGB.run(i, j)
        bfsRB.run(i, j)
    }
}

print("\(bfsRGB.result) \(bfsRB.result)")
