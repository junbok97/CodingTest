// https://www.acmicpc.net/problem/2630

import Foundation

func solution() {
    
    let N = Int(readLine()!)!

    var result = Array(repeating: 0, count: 2)
    
    var paper = (0..<N).map { _ in
        readLine()!
            .split(separator: " ")
            .compactMap { Int($0) }
    }

    
    recursion(0, 0, N)
    result.forEach { print("\($0)") }
    
    
    func recursion(_ x: Int, _ y:Int, _ z: Int) {
        
        if check(x, y, z) {
            result[paper[x][y]] += 1
            return
        }
        
        let n = z/2
        
        for i in 0..<2 {
            for j in 0..<2 {
                recursion(x + i * n, y + j * n, n)
            }
        }
    }

    
    func check(_ x: Int, _ y:Int, _ n: Int) -> Bool {
        
        for i in x..<x+n {
            for j in y..<y+n {
                if paper[x][y] != paper[i][j] { return false }
            }
        }

        return true
    }
}


solution()

