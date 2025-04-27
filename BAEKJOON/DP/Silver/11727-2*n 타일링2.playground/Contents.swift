// https://www.acmicpc.net/problem/11727

import Foundation


func solution() {
    
    let N = Int(readLine()!)!
    
    var d = Array(repeating: 0, count: N+3)
    
    d[1] = 1
    d[2] = 3
    
    // d[i-1]은 2*1 직사각형 하나만 가능
    // d[i-2]는 1*2 직사각형 두개와 2*2 정사각형 하나 즉 2가지를 놓을 수 있음
    for i in 3..<N+3 {
        d[i] = (d[i-1] + d[i-2] * 2) % 10_007
    }
    
    print(d[N])
}


solution()
