import Foundation

func solution(_ keyinput:[String], _ board:[Int]) -> [Int] {
    
    let board = board.map { $0 / 2 }
    var x = 0
    var y = 0
    
    for input in keyinput {
        switch input {
        case "right":
            x += 1
            if x > board[0] {
                x = board[0]
            }
        case "left":
            x -= 1
            if abs(x) > board[0] {
                x = -board[0]
            }
        case "up":
            y += 1
            if y > board[1] {
                y = board[1]
            }
        case "down":
            y -= 1
            if abs(y) > board[1] {
                y = -board[1]
            }
        default:
            break
        }
    }
    
    return [x,y]
}
