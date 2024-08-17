// https://www.acmicpc.net/problem/4179

import Foundation

var demessions = readLine()!
    .split(separator: " ")
    .compactMap { Int($0) }

let N = demessions.first!
let M = demessions.last!


let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]

var boards: [[String]] = []

var jihoonQueue: [(Int, Int)] = []
var jihoonBoards: [[Int]] = Array(repeating: Array(repeating: -1, count: M), count: N)

var fireQueue: [(Int, Int)] = []
var fireBoards: [[Int]] = Array(repeating: Array(repeating: -1, count: M), count: N)

for i in 0..<N {
    let input = readLine()!.map { String($0) }
    boards.append(input)
    
    for j in 0..<input.count {
        if input[j] == "F" {
            fireQueue.append((i, j))
            fireBoards[i][j] = 0
        }
        if input[j] == "J" {
            jihoonQueue.append((i, j))
            jihoonBoards[i][j] = 0
        }
    }
}

func fire() {
    var index = 0
    while index < fireQueue.count {
        let (x, y) = fireQueue[index]
        index += 1
        
        for dir in 0..<4 {
            let nx = x + dx[dir]
            let ny = y + dy[dir]
            
            if (0..<N ~= nx) && (0..<M ~= ny) && boards[nx][ny] != "#" && fireBoards[nx][ny] < 0  {
                fireQueue.append((nx, ny))
                fireBoards[nx][ny] = fireBoards[x][y] + 1
            }
        }
    }
}

func jihoon() {
    var index = 0
    while index < jihoonQueue.count {
        let (x, y) = jihoonQueue[index]
        index += 1
        
        for dir in 0..<4 {
            let nx = x + dx[dir]
            let ny = y + dy[dir]
            
            if !(0..<N ~= nx) || !(0..<M ~= ny) {
                print(jihoonBoards[x][y] + 1)
                return
            }
            
            if jihoonBoards[nx][ny] >= 0 || boards[nx][ny] == "#" { continue }
            if fireBoards[nx][ny] != -1 && fireBoards[nx][ny] <= jihoonBoards[x][y] + 1 { continue }
            
            jihoonQueue.append((nx, ny))
            jihoonBoards[nx][ny] = jihoonBoards[x][y] + 1
        }
    }

    print("IMPOSSIBLE")
}

fire()
jihoon()
