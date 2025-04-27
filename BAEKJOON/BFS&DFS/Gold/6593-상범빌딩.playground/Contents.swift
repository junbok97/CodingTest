// https://www.acmicpc.net/problem/6593

import Foundation

typealias Point = (x: Int, y: Int, z: Int)

func solution() {
    
    while true {
        
        let inputs = readLine()!
            .split(separator: " ")
            .compactMap { Int($0) }
        
        let L = inputs[0]
        let R = inputs[1]
        let C = inputs[2]
        
        if L == 0, R == 0, C == 0 { return }
        BFS(L, R, C)
    }

}


func BFS(_ L: Int, _ R: Int, _ C: Int) {
    
    var start = Point(-1, -1, -1)
    var end = Point(-1, -1, -1)
    var board: [[[String]]] = []
    var timeBoard = Array(repeating: Array(repeating: Array(repeating: -1, count: C), count: R), count: L)
    
    for k in 0..<L {
        
        var tmp: [[String]] = []
        
        for i in 0...R {
            let inputs = readLine()!.map(String.init)
            if inputs.isEmpty { continue }
            
            for j in 0..<inputs.count {
                if inputs[j] == "S" { start = (i, j, k) }
                else if inputs[j] == "E" { end = (i, j, k) }
            }
            tmp.append(inputs)
        }
        
        board.append(tmp)
    }

    
    let dx = [1, -1, 0, 0, 0, 0]
    let dy = [0, 0, 1, -1, 0, 0]
    let dz = [0, 0, 0, 0, 1, -1]
    
    
    var index = 0
    var queue: [Point] = [start]
    timeBoard[start.z][start.x][start.y] = 0
    
    while index < queue.count {
        
        let (x, y, z) = queue[index]
        index += 1
        
        
        for i in 0..<6 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            let nz = z + dz[i]
            
            if !((0..<R) ~= nx) || !((0..<C) ~= ny) || !((0..<L) ~= nz) { continue }
            if board[nz][nx][ny] == "#" || 0 < timeBoard[nz][nx][ny]{ continue }
            
            timeBoard[nz][nx][ny] = timeBoard[z][x][y] + 1
            queue.append((nx,ny,nz))
        }
    }
    
    if timeBoard[end.z][end.x][end.y] > 0 {
        print("Escaped in \(timeBoard[end.z][end.x][end.y]) minute(s).")
    } else {
        print("Trapped!")
    }
    
}


solution()
