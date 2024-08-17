import Foundation

struct Point: Hashable, Equatable {
    let x: Int
    let y: Int

    static func == (lhs:Point, rhs:Point) -> Bool {
        return lhs.x == rhs.x && lhs.y == rhs.y
    }
}

func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    let arr = board.map { Array($0) }
    var board: [[Character]] = [[Character]]()
    var eraseIndex: Set<Point> = Set()
    var answer: Int = 0

    for i in 0 ..< arr[0].count {
        var temp: [Character] = []
        arr.reversed().forEach {
            temp.append($0[i])
        }
        board.append(temp)
    }

    repeat {
        answer += eraseIndex.count
        eraseIndex.removeAll()

        var newBoard = board

        for i in 1 ..< board.count {
            if board[i].count == 0 { continue }
            for j in 0 ..< board[i].count - 1 {
                if board[i-1].count < j+2 { continue }
                if [board[i-1][j], board[i][j+1], board[i-1][j+1]].allSatisfy({ $0 == board[i][j] }) {
                    eraseIndex.insert(Point(x: i, y: j))
                    eraseIndex.insert(Point(x: i-1, y: j))
                    eraseIndex.insert(Point(x: i-1, y: j+1))
                    eraseIndex.insert(Point(x: i, y: j+1))
                }
            }
        }
        eraseIndex.sorted { $0.y > $1.y }.forEach {
            newBoard[$0.x].remove(at: $0.y)
        }
        board = newBoard
    } while !eraseIndex.isEmpty


    return answer
}

solution(4, 5, ["CCBDE", "AAADE", "AAABF", "CCBBF"])
