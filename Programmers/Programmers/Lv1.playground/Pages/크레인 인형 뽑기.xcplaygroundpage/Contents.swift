import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    
    var copyBoard = board
    var basket = [Int]()
    var count = 0
    
    for col in moves {
        for row in 0..<board.count {
            if copyBoard[row][col-1] != 0 {
                if basket.last == copyBoard[row][col-1] {
                    count += 2
                    basket.removeLast()
                } else {
                    basket.append(copyBoard[row][col-1])
                }
                copyBoard[row][col-1] = 0
                break
            }
        }
    }
    
    return count
}
