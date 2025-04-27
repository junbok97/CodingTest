// https://www.acmicpc.net/problem/11726

import Foundation


func solution() {
    
    let N = Int(readLine()!)!
    
    var d = Array(repeating: 0, count: N + 2)
    
    d[1] = 1
    d[2] = 2
    
    if N <= 2 {
        print(d[N])
        return
    }
    
    for i in 3...N {
        d[i] = (d[i-1] + d[i-2]) % 10_007
    }
    
    print(d[N])

}


solution()
