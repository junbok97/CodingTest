// https://www.acmicpc.net/problem/2193

import Foundation


func solution() {
    
    let N = Int(readLine()!)!
    
    var d = Array(repeating: Array(repeating: 0, count: 2), count: N+2)
    
    d[1][1] = 1
    
    for i in 2...N+1 {
        d[i][0] = d[i-1][0] + d[i-1][1]
        d[i][1] = d[i-1][0]
    }
    
    print(d[N][0] + d[N][1])
}


solution()
