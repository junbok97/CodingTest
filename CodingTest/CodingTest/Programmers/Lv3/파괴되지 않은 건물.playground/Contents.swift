// https://school.programmers.co.kr/learn/courses/30/lessons/92344

import Foundation

func solution(_ board:[[Int]], _ skills:[[Int]]) -> Int {
    
    let N = board.count
    let M = board[0].count
    
    var result = 0
    var prefixBoard = Array(repeating: Array(repeating: 0, count: M+1), count: N+1)
    
    for skill in skills {
        let type = skill[0]
        let (r1, c1) = (skill[1], skill[2])
        let (r2, c2) = (skill[3] + 1, skill[4] + 1)
        let degree = skill[5]
        
        if type == 1 {
            prefixBoard[r1][c1] -= degree
            prefixBoard[r2][c2] -= degree
            prefixBoard[r1][c2] += degree
            prefixBoard[r2][c1] += degree
        } else {
            prefixBoard[r1][c1] += degree
            prefixBoard[r2][c2] += degree
            prefixBoard[r1][c2] -= degree
            prefixBoard[r2][c1] -= degree
        }
    }
    
    for i in 1...N {
        for j in 0...M {
            prefixBoard[i][j] += prefixBoard[i-1][j]
        }
    }
    
    
    for i in 0...N {
        for j in 1...M {
            prefixBoard[i][j] += prefixBoard[i][j-1]
        }
    }
    
    for i in 0..<N {
        for j in 0..<M {
            if board[i][j] + prefixBoard[i][j] > 0 { result += 1 }
        }
    }
    
    return result
}

