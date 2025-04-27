import Foundation

typealias Point = (x: Int, y: Int)

let dx = [1, 0, -1, 0]
let dy = [0, 1, 0, -1]


let demessions = readLine()!
    .components(separatedBy: " ")
    .compactMap { Int($0) }

let Row = demessions[0]
let Col = demessions[1]

var jihoonBoard = Array(repeating: Array(repeating: 0, count: Col), count: Row)
var fireBoard = Array(repeating: Array(repeating: 0, count: Col), count: Row)


var jihoonQueue: [Point] = []
var fireQueue: [Point] = []

for i in 0..<Row {
    let inputs = Array(readLine()!)
    
    for j in 0..<Col {
        switch inputs[j] {
        case "#":
            jihoonBoard[i][j] = 0
            fireBoard[i][j] = 0
        case ".":
            jihoonBoard[i][j] = -1
            fireBoard[i][j] = -1
        case "J":
            jihoonBoard[i][j] = 1
            fireBoard[i][j] = -1
            jihoonQueue = [(i,j)]
        case "F" :
            jihoonBoard[i][j] = -1
            fireBoard[i][j] = 1
            fireQueue.append((i,j))
        default:
            break
        }
    }
}



func fire() {
    var index = 0
    
    while index < fireQueue.count {
        let (x, y) = fireQueue[index]
        index += 1
        
        for idx in 0..<4 {
            let nx = x + dx[idx]
            let ny = y + dy[idx]
            
            if nx < 0 || ny < 0 || Row <= nx || Col <= ny || -1 < fireBoard[nx][ny] {
                continue
            }
            
            fireBoard[nx][ny] = fireBoard[x][y] + 1
            fireQueue.append((nx, ny))
        }
    }
}


func jihoon() {
    var index = 0
    
    while index < jihoonQueue.count {
        let (x, y) = jihoonQueue[index]
        index += 1
        
        for idx in 0..<4 {
            let nx = x + dx[idx]
            let ny = y + dy[idx]
            
            if nx < 0 || ny < 0 || Row <= nx || Col <= ny {
                print(jihoonBoard[x][y])
                return
            }
            
            if -1 < jihoonBoard[nx][ny] {
                continue
            }
                    
            if fireBoard[nx][ny] != -1 && fireBoard[nx][ny] <= jihoonBoard[x][y] + 1 {
                continue
            }
            
            jihoonBoard[nx][ny] = jihoonBoard[x][y] + 1
            jihoonQueue.append((nx, ny))
        }
    }
    print("IMPOSSIBLE")
}

fire()
jihoon()
