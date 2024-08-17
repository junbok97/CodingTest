// https://www.acmicpc.net/problem/1992

import Foundation

func solution() {
    
    let Iterator = Int(readLine()!)!
    
    let video = (0..<Iterator).map { _ in
        readLine()!.compactMap { Int(String($0)) }
    }
    
    let N = video.count
    let M = video[0].count

    
    print(recursion(0, 0, N, M))
    
    
    func recursion(_ x: Int, _ y:Int, _ n: Int, _ m: Int) -> String {
        
        var result = ""
        
        if check(x, y, n, m) {
            result = "\(video[x][y])"
            return result
        }
        
        let newN = n/2
        let newM = m/2
        
        for i in 0..<2 {
            for j in 0..<2 {
                result += "\(recursion(x + i * newN, y + j * newN, newN, newM))"
            }
        }
        
        return "(\(result))"
    }

    
    func check(_ x: Int, _ y:Int, _ n: Int, _ m: Int) -> Bool {
        
        for i in x..<x+n {
            for j in y..<y+m {
                if video[x][y] != video[i][j] { return false }
            }
        }

        return true
    }
}


solution()

