// https://www.acmicpc.net/problem/5427
import Foundation


let dx = [1, -1, 0, 0]
let dy = [0, 0, 1, -1]

var buildingMap: [[Character]] = []

var shangunQueue: [(Int, Int)] = []
var shangunBoard: [[Int]] = []

var fireQueue: [(Int, Int)] = []
var fireBoard: [[Int]] = []


func solution() {
    
    let repetition = Int(readLine()!)!
    
    for _ in 1...repetition {
        
        let inputs = readLine()!
            .components(separatedBy: " ")
            .compactMap { Int($0) }
        
        let n = inputs[1]
        let m = inputs[0]
        
        bfs(n, m)
    }
    
}



func bfs(_ N: Int, _ M: Int) {
    
    buildingMap = []
    
    shangunQueue = []
    shangunBoard = Array(repeating: Array(repeating: -1, count: M), count: N)
    
    fireQueue = []
    fireBoard = Array(repeating: Array(repeating: -1, count: M), count: N)
    
    for i in 0..<N {
        
        let inputs = Array(readLine()!)
            
        for j in 0..<M {
            if inputs[j] == "*" {
                fireBoard[i][j] = 0
                fireQueue.append((i, j))
            }
            
            if inputs[j] == "@" {
                shangunBoard[i][j] = 0
                shangunQueue.append((i,j))
            }
        }
         
        buildingMap.append(inputs)
    }
    
    fire(N, M)
    shangun(N, M)
}


func fire(_ N: Int, _ M: Int) {
    
    var index = 0
    
    while index < fireQueue.count {
        
        let (x, y) = fireQueue[index]
        index += 1
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if nx < 0 || nx >= N ||
                ny < 0 || ny >= M ||
                buildingMap[nx][ny] == "#" ||
                fireBoard[nx][ny] > -1 { continue }
                
            fireBoard[nx][ny] = fireBoard[x][y] + 1
            fireQueue.append((nx, ny))
        }
    }
    
}


func shangun(_ N: Int, _ M: Int) {

    var index = 0
    
    while index < shangunQueue.count {
        
        let (x, y) = shangunQueue[index]
        index += 1
        
        for i in 0..<4 {
            
            let nx = x + dx[i]
            let ny = y + dy[i]
            
            if !(0..<N ~= nx) || !(0..<M ~= ny) {
                print(shangunBoard[x][y] + 1)
                return
            }
            
            if  buildingMap[nx][ny] == "#" ||
                    shangunBoard[nx][ny] > -1 { continue }
                
            
            if fireBoard[nx][ny] != -1 &&
                fireBoard[nx][ny] <= shangunBoard[x][y] + 1 { continue }
            
            shangunBoard[nx][ny] = shangunBoard[x][y] + 1
            shangunQueue.append((nx, ny))
            
        }
    }
    
    print("IMPOSSIBLE")
}



solution()
