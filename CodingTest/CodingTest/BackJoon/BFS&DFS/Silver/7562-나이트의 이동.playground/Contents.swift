// https://www.acmicpc.net/problem/7562
import Foundation


typealias Position = (x: Int, y: Int)


func +(lhs: Position, rhs: Position) -> Position {
    Position(lhs.x + rhs.x, lhs.y + rhs.y)
}


func solution() {
    
    let repetition = Int(readLine()!)!

    for _ in 1...repetition {
        
        let dimension = Int(readLine()!)!
        
        
        let startPositionArray = readLine()!
            .components(separatedBy: " ")
            .compactMap { Int($0) }
            
        let startPosition = Position(startPositionArray.first!, startPositionArray.last!)
        
        
        let targetPositionArray = readLine()!
            .components(separatedBy: " ")
            .compactMap { Int($0) }
        
        let targetPosition = Position(targetPositionArray.first!, targetPositionArray.last!)
        
        print(bfs(dimension, startPosition, targetPosition))
    }

    
}


func bfs( _ dimension: Int, _ start: Position, _ target: Position) -> Int {
    
    let dirs: [Position] = [(2,1), (1,2),(-1,2),(-2,1), (-2, -1), (-1,-2), (1,-2),( 2,-1)]
    
    
    var index = 0
    var queue: [Position] = [start]
    var chessBoard = Array(repeating: Array(repeating: 0, count: dimension), count: dimension)
    
    
    while index < queue.count {
        
        let currentPosition = queue[index]
        index += 1
        
        if currentPosition == target {
            return chessBoard[target.x][target.y]
        }
        
        for dir in dirs {
            let nextPosition = currentPosition + dir
            
            if nextPosition.x < 0 || nextPosition.x >= dimension ||
                nextPosition.y < 0 || nextPosition.y >= dimension ||
                chessBoard[nextPosition.x][nextPosition.y] > 0 { continue }
            
            
            chessBoard[nextPosition.x][nextPosition.y] = chessBoard[currentPosition.x][currentPosition.y] + 1
            queue.append(nextPosition)
        }
    }
    
    return chessBoard[target.x][target.y]
    
}


solution()
