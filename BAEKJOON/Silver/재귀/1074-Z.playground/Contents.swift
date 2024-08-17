// https://www.acmicpc.net/problem/1074

import Foundation

func solution() {
    
    let inputs = readLine()!
        .components(separatedBy: " ")
        .compactMap { Int($0) }
    
    
    let n = inputs[0]
    let row = inputs[1]
    let col = inputs[2]
    
    
    print(recursion(n, row, col))
}

func recursion(_ n: Int, _ row: Int, _ col: Int) -> Int {
    
    if n == 0 { return 0 }
    
    let half = 1 << (n-1)
    
    // 왼쪽 위
    if row < half && col < half { return recursion(n-1, row, col) }
    // 오른쪽 위
    if row < half && col >= half { return half * half + recursion(n-1, row, col-half) }
    // 왼쪽 아래
    if row >= half && col < half { return 2 * half * half + recursion(n-1, row-half, col) }
    // 오른쪽 아래
    return 3 * half * half + recursion(n-1, row-half, col-half)
}

solution()
