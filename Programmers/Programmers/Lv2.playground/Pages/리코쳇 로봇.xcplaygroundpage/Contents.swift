import Foundation

typealias Position = (x: Int, y: Int)

func solution(_ board:[String]) -> Int {
    
    let newBoard = board.map { $0.map { String($0)}}
    let maxRow = newBoard.count
    let maxCol = newBoard[0].count
    let direction: [Position] = [(-1, 0), (1, 0), (0, -1), (0, 1)]
    
    var moveCount = -1
    var position: Position = (0, 0)
    var queue: [(position: Position, count: Int)] = []
    var visited: [[Bool]] = Array(
        repeating: Array(
            repeating: false,
            count: newBoard[0].count
        ),
        count: newBoard.count
    )
    
    for i in 0..<board.count {
        for (j, char) in board[i].enumerated() {
            if char == "R" {
                position = (i, j)
                break
            }
        }
    }

    visited[position.x][position.y] = true

    func bfs(position: Position, count: Int) {
        if newBoard[position.x][position.y] == "G" {
            moveCount = count
            return
        }

        for dir in direction {
            var newPosition = position
            while true {
                let (x, y) = (newPosition.x + dir.x, newPosition.y + dir.y)
                if x < 0 || y < 0 || maxRow <= x || maxCol <= y {
                    break
                }
                else if newBoard[x][y] == "D" {
                    break
                }
                newPosition = (x, y)
            }
            if !visited[newPosition.x][newPosition.y] {
                visited[newPosition.x][newPosition.y] = true
                queue.insert((newPosition, count+1), at: 0)
            }
        }


        if let item = queue.last {
            queue.removeLast()
            bfs(position: item.position, count: item.count)
        }

    }

    bfs(position: position, count: 0)

    return moveCount
}

